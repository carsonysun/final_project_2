class HabitsController < ApplicationController
  before_action :current_user_must_be_habit_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_habit_user
    habit = Habit.find(params[:id])

    unless current_user == habit.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Habit.ransack(params[:q])
    @habits = @q.result(:distinct => true).includes(:user, :aspiration, :logs).page(params[:page]).per(10)

    render("habits/index.html.erb")
  end

  def show
    @log = Log.new
    @habit = Habit.find(params[:id])

    render("habits/show.html.erb")
  end

  def new
    @habit = Habit.new

    render("habits/new.html.erb")
  end

  def create
    @habit = Habit.new

    @habit.user_id = params[:user_id]
    @habit.aspiration_id = params[:aspiration_id]
    @habit.name = params[:name]
    @habit.goal = params[:goal]
    @habit.days_per_week = params[:days_per_week]

    save_status = @habit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/habits/new", "/create_habit"
        redirect_to("/habits")
      else
        redirect_back(:fallback_location => "/", :notice => "Habit created successfully.")
      end
    else
      render("habits/new.html.erb")
    end
  end

  def edit
    @habit = Habit.find(params[:id])

    render("habits/edit.html.erb")
  end

  def update
    @habit = Habit.find(params[:id])
    @habit.aspiration_id = params[:aspiration_id]
    @habit.name = params[:name]
    @habit.goal = params[:goal]
    @habit.days_per_week = params[:days_per_week]

    save_status = @habit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/habits/#{@habit.id}/edit", "/update_habit"
        redirect_to("/habits/#{@habit.id}", :notice => "Habit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Habit updated successfully.")
      end
    else
      render("habits/edit.html.erb")
    end
  end

  def destroy
    @habit = Habit.find(params[:id])

    @habit.destroy

    if URI(request.referer).path == "/habits/#{@habit.id}"
      redirect_to("/", :notice => "Habit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Habit deleted.")
    end
  end
end
