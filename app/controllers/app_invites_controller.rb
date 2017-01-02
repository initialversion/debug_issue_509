class AppInvitesController < ApplicationController
  def index
    @app_invites = AppInvite.page(params[:page]).per(10)

    render("app_invites/index.html.erb")
  end

  def show
    @app_invite = AppInvite.find(params[:id])

    render("app_invites/show.html.erb")
  end

  def new
    @app_invite = AppInvite.new

    render("app_invites/new.html.erb")
  end

  def create
    @app_invite = AppInvite.new

    @app_invite.sender_id = params[:sender_id]
    @app_invite.recipient_id = params[:recipient_id]
    @app_invite.status = params[:status]

    save_status = @app_invite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/app_invites/new", "/create_app_invite"
        redirect_to("/app_invites")
      else
        redirect_back(:fallback_location => "/", :notice => "App invite created successfully.")
      end
    else
      render("app_invites/new.html.erb")
    end
  end

  def edit
    @app_invite = AppInvite.find(params[:id])

    render("app_invites/edit.html.erb")
  end

  def update
    @app_invite = AppInvite.find(params[:id])

    @app_invite.sender_id = params[:sender_id]
    @app_invite.recipient_id = params[:recipient_id]
    @app_invite.status = params[:status]

    save_status = @app_invite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/app_invites/#{@app_invite.id}/edit", "/update_app_invite"
        redirect_to("/app_invites/#{@app_invite.id}", :notice => "App invite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "App invite updated successfully.")
      end
    else
      render("app_invites/edit.html.erb")
    end
  end

  def destroy
    @app_invite = AppInvite.find(params[:id])

    @app_invite.destroy

    if URI(request.referer).path == "/app_invites/#{@app_invite.id}"
      redirect_to("/", :notice => "App invite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "App invite deleted.")
    end
  end
end
