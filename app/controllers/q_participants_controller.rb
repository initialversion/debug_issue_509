class QParticipantsController < ApplicationController
  def index
    @q = QParticipant.ransack(params[:q])
    @q_participants = @q.result(:distinct => true).includes(:user, :q, :q_invitations).page(params[:page]).per(10)

    render("q_participants/index.html.erb")
  end

  def show
    @q_invitation = QInvitation.new
    @q_participant = QParticipant.find(params[:id])

    render("q_participants/show.html.erb")
  end

  def new
    @q_participant = QParticipant.new

    render("q_participants/new.html.erb")
  end

  def create
    @q_participant = QParticipant.new

    @q_participant.user_id = params[:user_id]
    @q_participant.status = params[:status]
    @q_participant.host_status = params[:host_status]
    @q_participant.queue_id = params[:queue_id]

    save_status = @q_participant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/q_participants/new", "/create_q_participant"
        redirect_to("/q_participants")
      else
        redirect_back(:fallback_location => "/", :notice => "Q participant created successfully.")
      end
    else
      render("q_participants/new.html.erb")
    end
  end

  def edit
    @q_participant = QParticipant.find(params[:id])

    render("q_participants/edit.html.erb")
  end

  def update
    @q_participant = QParticipant.find(params[:id])

    @q_participant.user_id = params[:user_id]
    @q_participant.status = params[:status]
    @q_participant.host_status = params[:host_status]
    @q_participant.queue_id = params[:queue_id]

    save_status = @q_participant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/q_participants/#{@q_participant.id}/edit", "/update_q_participant"
        redirect_to("/q_participants/#{@q_participant.id}", :notice => "Q participant updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Q participant updated successfully.")
      end
    else
      render("q_participants/edit.html.erb")
    end
  end

  def destroy
    @q_participant = QParticipant.find(params[:id])

    @q_participant.destroy

    if URI(request.referer).path == "/q_participants/#{@q_participant.id}"
      redirect_to("/", :notice => "Q participant deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Q participant deleted.")
    end
  end
end
