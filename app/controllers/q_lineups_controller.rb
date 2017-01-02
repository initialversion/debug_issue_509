class QLineupsController < ApplicationController
  def index
    @q_lineups = QLineup.page(params[:page]).per(10)

    render("q_lineups/index.html.erb")
  end

  def show
    @suggestion = Suggestion.new
    @inspiration = Inspiration.new
    @q_lineup = QLineup.find(params[:id])

    render("q_lineups/show.html.erb")
  end

  def new
    @q_lineup = QLineup.new

    render("q_lineups/new.html.erb")
  end

  def create
    @q_lineup = QLineup.new

    @q_lineup.suggestion_or_inspiration = params[:suggestion_or_inspiration]
    @q_lineup.inspiration_id = params[:inspiration_id]
    @q_lineup.suggestion_id = params[:suggestion_id]
    @q_lineup.active = params[:active]
    @q_lineup.lineup_order = params[:lineup_order]
    @q_lineup.q_id = params[:q_id]

    save_status = @q_lineup.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/q_lineups/new", "/create_q_lineup"
        redirect_to("/q_lineups")
      else
        redirect_back(:fallback_location => "/", :notice => "Q lineup created successfully.")
      end
    else
      render("q_lineups/new.html.erb")
    end
  end

  def edit
    @q_lineup = QLineup.find(params[:id])

    render("q_lineups/edit.html.erb")
  end

  def update
    @q_lineup = QLineup.find(params[:id])

    @q_lineup.suggestion_or_inspiration = params[:suggestion_or_inspiration]
    @q_lineup.inspiration_id = params[:inspiration_id]
    @q_lineup.suggestion_id = params[:suggestion_id]
    @q_lineup.active = params[:active]
    @q_lineup.lineup_order = params[:lineup_order]
    @q_lineup.q_id = params[:q_id]

    save_status = @q_lineup.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/q_lineups/#{@q_lineup.id}/edit", "/update_q_lineup"
        redirect_to("/q_lineups/#{@q_lineup.id}", :notice => "Q lineup updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Q lineup updated successfully.")
      end
    else
      render("q_lineups/edit.html.erb")
    end
  end

  def destroy
    @q_lineup = QLineup.find(params[:id])

    @q_lineup.destroy

    if URI(request.referer).path == "/q_lineups/#{@q_lineup.id}"
      redirect_to("/", :notice => "Q lineup deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Q lineup deleted.")
    end
  end
end
