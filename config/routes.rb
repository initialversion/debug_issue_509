Rails.application.routes.draw do
  # Routes for the Queue resource:
  # CREATE
  get "/queues/new", :controller => "queues", :action => "new"
  post "/create_queue", :controller => "queues", :action => "create"

  # READ
  get "/queues", :controller => "queues", :action => "index"
  get "/queues/:id", :controller => "queues", :action => "show"

  # UPDATE
  get "/queues/:id/edit", :controller => "queues", :action => "edit"
  post "/update_queue/:id", :controller => "queues", :action => "update"

  # DELETE
  get "/delete_queue/:id", :controller => "queues", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
