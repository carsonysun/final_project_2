Rails.application.routes.draw do
  root :to => "aspirations#index"
  # Routes for the Accomplishment resource:
  # CREATE
  get "/accomplishments/new", :controller => "accomplishments", :action => "new"
  post "/create_accomplishment", :controller => "accomplishments", :action => "create"

  # READ
  get "/accomplishments", :controller => "accomplishments", :action => "index"
  get "/accomplishments/:id", :controller => "accomplishments", :action => "show"

  # UPDATE
  get "/accomplishments/:id/edit", :controller => "accomplishments", :action => "edit"
  post "/update_accomplishment/:id", :controller => "accomplishments", :action => "update"

  # DELETE
  get "/delete_accomplishment/:id", :controller => "accomplishments", :action => "destroy"
  #------------------------------

  # Routes for the Log resource:
  # CREATE
  get "/logs/new", :controller => "logs", :action => "new"
  post "/create_log", :controller => "logs", :action => "create"

  # READ
  get "/logs", :controller => "logs", :action => "index"
  get "/logs/:id", :controller => "logs", :action => "show"

  # UPDATE
  get "/logs/:id/edit", :controller => "logs", :action => "edit"
  post "/update_log/:id", :controller => "logs", :action => "update"

  # DELETE
  get "/delete_log/:id", :controller => "logs", :action => "destroy"
  #------------------------------

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
