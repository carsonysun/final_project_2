Rails.application.routes.draw do
  # Routes for the Habit resource:
  # CREATE
  get "/habits/new", :controller => "habits", :action => "new"
  post "/create_habit", :controller => "habits", :action => "create"

  # READ
  get "/habits", :controller => "habits", :action => "index"
  get "/habits/:id", :controller => "habits", :action => "show"

  # UPDATE
  get "/habits/:id/edit", :controller => "habits", :action => "edit"
  post "/update_habit/:id", :controller => "habits", :action => "update"

  # DELETE
  get "/delete_habit/:id", :controller => "habits", :action => "destroy"
  #------------------------------

  # Routes for the Aspiration resource:
  # CREATE
  get "/aspirations/new", :controller => "aspirations", :action => "new"
  post "/create_aspiration", :controller => "aspirations", :action => "create"

  # READ
  get "/aspirations", :controller => "aspirations", :action => "index"
  get "/aspirations/:id", :controller => "aspirations", :action => "show"

  # UPDATE
  get "/aspirations/:id/edit", :controller => "aspirations", :action => "edit"
  post "/update_aspiration/:id", :controller => "aspirations", :action => "update"

  # DELETE
  get "/delete_aspiration/:id", :controller => "aspirations", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
