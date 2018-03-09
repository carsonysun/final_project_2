class AspirationsController < ApplicationController
  def index
    @aspirations = Aspiration.all

    render("aspirations/index.html.erb")
  end

  def show
    @aspiration = Aspiration.find(params[:id])

    render("aspirations/show.html.erb")
  end

  def new
    @aspiration = Aspiration.new

    render("aspirations/new.html.erb")
  end

  def create
    @aspiration = Aspiration.new

    @aspiration.name = params[:name]

    save_status = @aspiration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/aspirations/new", "/create_aspiration"
        redirect_to("/aspirations")
      else
        redirect_back(:fallback_location => "/", :notice => "Aspiration created successfully.")
      end
    else
      render("aspirations/new.html.erb")
    end
  end

  def edit
    @aspiration = Aspiration.find(params[:id])

    render("aspirations/edit.html.erb")
  end

  def update
    @aspiration = Aspiration.find(params[:id])

    @aspiration.name = params[:name]

    save_status = @aspiration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/aspirations/#{@aspiration.id}/edit", "/update_aspiration"
        redirect_to("/aspirations/#{@aspiration.id}", :notice => "Aspiration updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Aspiration updated successfully.")
      end
    else
      render("aspirations/edit.html.erb")
    end
  end

  def destroy
    @aspiration = Aspiration.find(params[:id])

    @aspiration.destroy

    if URI(request.referer).path == "/aspirations/#{@aspiration.id}"
      redirect_to("/", :notice => "Aspiration deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Aspiration deleted.")
    end
  end
end
