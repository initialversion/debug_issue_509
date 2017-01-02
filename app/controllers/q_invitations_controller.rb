class QInvitationsController < ApplicationController
  def index
    @q_invitations = QInvitation.page(params[:page]).per(10)

    render("q_invitations/index.html.erb")
  end

  def show
    @q_invitation = QInvitation.find(params[:id])

    render("q_invitations/show.html.erb")
  end

  def new
    @q_invitation = QInvitation.new

    render("q_invitations/new.html.erb")
  end

  def create
    @q_invitation = QInvitation.new

    @q_invitation.sender_id = params[:sender_id]
    @q_invitation.recipient_id = params[:recipient_id]
    @q_invitation.status = params[:status]
    @q_invitation.queue_id = params[:queue_id]

    save_status = @q_invitation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/q_invitations/new", "/create_q_invitation"
        redirect_to("/q_invitations")
      else
        redirect_back(:fallback_location => "/", :notice => "Q invitation created successfully.")
      end
    else
      render("q_invitations/new.html.erb")
    end
  end

  def edit
    @q_invitation = QInvitation.find(params[:id])

    render("q_invitations/edit.html.erb")
  end

  def update
    @q_invitation = QInvitation.find(params[:id])

    @q_invitation.sender_id = params[:sender_id]
    @q_invitation.recipient_id = params[:recipient_id]
    @q_invitation.status = params[:status]
    @q_invitation.queue_id = params[:queue_id]

    save_status = @q_invitation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/q_invitations/#{@q_invitation.id}/edit", "/update_q_invitation"
        redirect_to("/q_invitations/#{@q_invitation.id}", :notice => "Q invitation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Q invitation updated successfully.")
      end
    else
      render("q_invitations/edit.html.erb")
    end
  end

  def destroy
    @q_invitation = QInvitation.find(params[:id])

    @q_invitation.destroy

    if URI(request.referer).path == "/q_invitations/#{@q_invitation.id}"
      redirect_to("/", :notice => "Q invitation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Q invitation deleted.")
    end
  end
end
