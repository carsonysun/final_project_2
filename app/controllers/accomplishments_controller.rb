class AccomplishmentsController < ApplicationController
  def index
    @q = Accomplishment.ransack(params[:q])
    @accomplishments = @q.result(:distinct => true).includes(:log).page(params[:page]).per(10)

    render("accomplishments/index.html.erb")
  end

  def show
    @accomplishment = Accomplishment.find(params[:id])

    render("accomplishments/show.html.erb")
  end

  def new
    @accomplishment = Accomplishment.new

    render("accomplishments/new.html.erb")
  end

  def create
    @accomplishment = Accomplishment.new

    @accomplishment.log_id = params[:log_id]
    @accomplishment.milestone = params[:milestone]
    @accomplishment.image_url = params[:image_url]

    save_status = @accomplishment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accomplishments/new", "/create_accomplishment"
        redirect_to("/accomplishments")
      else
        redirect_back(:fallback_location => "/", :notice => "Accomplishment created successfully.")
      end
    else
      render("accomplishments/new.html.erb")
    end
  end

  def edit
    @accomplishment = Accomplishment.find(params[:id])

    render("accomplishments/edit.html.erb")
  end

  def update
    @accomplishment = Accomplishment.find(params[:id])

    @accomplishment.log_id = params[:log_id]
    @accomplishment.milestone = params[:milestone]
    @accomplishment.image_url = params[:image_url]

    save_status = @accomplishment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accomplishments/#{@accomplishment.id}/edit", "/update_accomplishment"
        redirect_to("/accomplishments/#{@accomplishment.id}", :notice => "Accomplishment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Accomplishment updated successfully.")
      end
    else
      render("accomplishments/edit.html.erb")
    end
  end

  def destroy
    @accomplishment = Accomplishment.find(params[:id])

    @accomplishment.destroy

    if URI(request.referer).path == "/accomplishments/#{@accomplishment.id}"
      redirect_to("/", :notice => "Accomplishment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Accomplishment deleted.")
    end
  end
end
