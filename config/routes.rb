Rails.application.routes.draw do
  # Routes for the App_invite resource:
  # CREATE
  get "/app_invites/new", :controller => "app_invites", :action => "new"
  post "/create_app_invite", :controller => "app_invites", :action => "create"

  # READ
  get "/app_invites", :controller => "app_invites", :action => "index"
  get "/app_invites/:id", :controller => "app_invites", :action => "show"

  # UPDATE
  get "/app_invites/:id/edit", :controller => "app_invites", :action => "edit"
  post "/update_app_invite/:id", :controller => "app_invites", :action => "update"

  # DELETE
  get "/delete_app_invite/:id", :controller => "app_invites", :action => "destroy"
  #------------------------------

  # Routes for the Q_invitation resource:
  # CREATE
  get "/q_invitations/new", :controller => "q_invitations", :action => "new"
  post "/create_q_invitation", :controller => "q_invitations", :action => "create"

  # READ
  get "/q_invitations", :controller => "q_invitations", :action => "index"
  get "/q_invitations/:id", :controller => "q_invitations", :action => "show"

  # UPDATE
  get "/q_invitations/:id/edit", :controller => "q_invitations", :action => "edit"
  post "/update_q_invitation/:id", :controller => "q_invitations", :action => "update"

  # DELETE
  get "/delete_q_invitation/:id", :controller => "q_invitations", :action => "destroy"
  #------------------------------

  # Routes for the Vote resource:
  # CREATE
  get "/votes/new", :controller => "votes", :action => "new"
  post "/create_vote", :controller => "votes", :action => "create"

  # READ
  get "/votes", :controller => "votes", :action => "index"
  get "/votes/:id", :controller => "votes", :action => "show"

  # UPDATE
  get "/votes/:id/edit", :controller => "votes", :action => "edit"
  post "/update_vote/:id", :controller => "votes", :action => "update"

  # DELETE
  get "/delete_vote/:id", :controller => "votes", :action => "destroy"
  #------------------------------

  # Routes for the Suggestion resource:
  # CREATE
  get "/suggestions/new", :controller => "suggestions", :action => "new"
  post "/create_suggestion", :controller => "suggestions", :action => "create"

  # READ
  get "/suggestions", :controller => "suggestions", :action => "index"
  get "/suggestions/:id", :controller => "suggestions", :action => "show"

  # UPDATE
  get "/suggestions/:id/edit", :controller => "suggestions", :action => "edit"
  post "/update_suggestion/:id", :controller => "suggestions", :action => "update"

  # DELETE
  get "/delete_suggestion/:id", :controller => "suggestions", :action => "destroy"
  #------------------------------

  # Routes for the Q_participant resource:
  # CREATE
  get "/q_participants/new", :controller => "q_participants", :action => "new"
  post "/create_q_participant", :controller => "q_participants", :action => "create"

  # READ
  get "/q_participants", :controller => "q_participants", :action => "index"
  get "/q_participants/:id", :controller => "q_participants", :action => "show"

  # UPDATE
  get "/q_participants/:id/edit", :controller => "q_participants", :action => "edit"
  post "/update_q_participant/:id", :controller => "q_participants", :action => "update"

  # DELETE
  get "/delete_q_participant/:id", :controller => "q_participants", :action => "destroy"
  #------------------------------

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
