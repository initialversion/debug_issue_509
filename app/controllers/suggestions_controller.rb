class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.page(params[:page]).per(10)

    render("suggestions/index.html.erb")
  end

  def show
    @vote = Vote.new
    @suggestion = Suggestion.find(params[:id])

    render("suggestions/show.html.erb")
  end

  def new
    @suggestion = Suggestion.new

    render("suggestions/new.html.erb")
  end

  def create
    @suggestion = Suggestion.new

    @suggestion.user_id = params[:user_id]
    @suggestion.song_id = params[:song_id]
    @suggestion.up_vote_count = params[:up_vote_count]
    @suggestion.down_vote_count = params[:down_vote_count]
    @suggestion.status = params[:status]
    @suggestion.qlineup_id = params[:qlineup_id]

    save_status = @suggestion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/suggestions/new", "/create_suggestion"
        redirect_to("/suggestions")
      else
        redirect_back(:fallback_location => "/", :notice => "Suggestion created successfully.")
      end
    else
      render("suggestions/new.html.erb")
    end
  end

  def edit
    @suggestion = Suggestion.find(params[:id])

    render("suggestions/edit.html.erb")
  end

  def update
    @suggestion = Suggestion.find(params[:id])

    @suggestion.user_id = params[:user_id]
    @suggestion.song_id = params[:song_id]
    @suggestion.up_vote_count = params[:up_vote_count]
    @suggestion.down_vote_count = params[:down_vote_count]
    @suggestion.status = params[:status]
    @suggestion.qlineup_id = params[:qlineup_id]

    save_status = @suggestion.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/suggestions/#{@suggestion.id}/edit", "/update_suggestion"
        redirect_to("/suggestions/#{@suggestion.id}", :notice => "Suggestion updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Suggestion updated successfully.")
      end
    else
      render("suggestions/edit.html.erb")
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])

    @suggestion.destroy

    if URI(request.referer).path == "/suggestions/#{@suggestion.id}"
      redirect_to("/", :notice => "Suggestion deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Suggestion deleted.")
    end
  end
end
