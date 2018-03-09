class LogsController < ApplicationController
  def index
    @logs = Log.page(params[:page]).per(10)

    render("logs/index.html.erb")
  end

  def show
    @accomplishment = Accomplishment.new
    @log = Log.find(params[:id])

    render("logs/show.html.erb")
  end

  def new
    @log = Log.new

    render("logs/new.html.erb")
  end

  def create
    @log = Log.new

    @log.date = params[:date]
    @log.time_of_day = params[:time_of_day]
    @log.motivation_level = params[:motivation_level]
    @log.rating_of_the_day = params[:rating_of_the_day]
    @log.habit_id = params[:habit_id]

    save_status = @log.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/logs/new", "/create_log"
        redirect_to("/logs")
      else
        redirect_back(:fallback_location => "/", :notice => "Log created successfully.")
      end
    else
      render("logs/new.html.erb")
    end
  end

  def edit
    @log = Log.find(params[:id])

    render("logs/edit.html.erb")
  end

  def update
    @log = Log.find(params[:id])

    @log.date = params[:date]
    @log.time_of_day = params[:time_of_day]
    @log.motivation_level = params[:motivation_level]
    @log.rating_of_the_day = params[:rating_of_the_day]
    @log.habit_id = params[:habit_id]

    save_status = @log.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/logs/#{@log.id}/edit", "/update_log"
        redirect_to("/logs/#{@log.id}", :notice => "Log updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Log updated successfully.")
      end
    else
      render("logs/edit.html.erb")
    end
  end

  def destroy
    @log = Log.find(params[:id])

    @log.destroy

    if URI(request.referer).path == "/logs/#{@log.id}"
      redirect_to("/", :notice => "Log deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Log deleted.")
    end
  end
end
