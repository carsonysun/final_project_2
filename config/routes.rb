Rails.application.routes.draw do
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
