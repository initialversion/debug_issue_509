class InspirationsController < ApplicationController
  def index
    @inspirations = Inspiration.page(params[:page]).per(10)

    render("inspirations/index.html.erb")
  end

  def show
    @q_lineup = QLineup.new
    @inspiration = Inspiration.find(params[:id])

    render("inspirations/show.html.erb")
  end

  def new
    @inspiration = Inspiration.new

    render("inspirations/new.html.erb")
  end

  def create
    @inspiration = Inspiration.new

    @inspiration.seed_track_id = params[:seed_track_id]
    @inspiration.inspiration_song_id = params[:inspiration_song_id]
    @inspiration.up_vote_count = params[:up_vote_count]
    @inspiration.down_vote_count = params[:down_vote_count]
    @inspiration.qlineup_id = params[:qlineup_id]
    @inspiration.status = params[:status]

    save_status = @inspiration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inspirations/new", "/create_inspiration"
        redirect_to("/inspirations")
      else
        redirect_back(:fallback_location => "/", :notice => "Inspiration created successfully.")
      end
    else
      render("inspirations/new.html.erb")
    end
  end

  def edit
    @inspiration = Inspiration.find(params[:id])

    render("inspirations/edit.html.erb")
  end

  def update
    @inspiration = Inspiration.find(params[:id])

    @inspiration.seed_track_id = params[:seed_track_id]
    @inspiration.inspiration_song_id = params[:inspiration_song_id]
    @inspiration.up_vote_count = params[:up_vote_count]
    @inspiration.down_vote_count = params[:down_vote_count]
    @inspiration.qlineup_id = params[:qlineup_id]
    @inspiration.status = params[:status]

    save_status = @inspiration.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inspirations/#{@inspiration.id}/edit", "/update_inspiration"
        redirect_to("/inspirations/#{@inspiration.id}", :notice => "Inspiration updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Inspiration updated successfully.")
      end
    else
      render("inspirations/edit.html.erb")
    end
  end

  def destroy
    @inspiration = Inspiration.find(params[:id])

    @inspiration.destroy

    if URI(request.referer).path == "/inspirations/#{@inspiration.id}"
      redirect_to("/", :notice => "Inspiration deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Inspiration deleted.")
    end
  end
end
