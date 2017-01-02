class UserLibraryTracksController < ApplicationController
  def index
    @user_library_tracks = UserLibraryTrack.all

    render("user_library_tracks/index.html.erb")
  end

  def show
    @user_library_track = UserLibraryTrack.find(params[:id])

    render("user_library_tracks/show.html.erb")
  end

  def new
    @user_library_track = UserLibraryTrack.new

    render("user_library_tracks/new.html.erb")
  end

  def create
    @user_library_track = UserLibraryTrack.new

    @user_library_track.song_id = params[:song_id]
    @user_library_track.song_name = params[:song_name]
    @user_library_track.song_artist = params[:song_artist]
    @user_library_track.song_attributes = params[:song_attributes]
    @user_library_track.number_of_listens = params[:number_of_listens]
    @user_library_track.genre = params[:genre]
    @user_library_track.last_listened_to_date = params[:last_listened_to_date]
    @user_library_track.song_release_date = params[:song_release_date]
    @user_library_track.liked = params[:liked]

    save_status = @user_library_track.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_library_tracks/new", "/create_user_library_track"
        redirect_to("/user_library_tracks")
      else
        redirect_back(:fallback_location => "/", :notice => "User library track created successfully.")
      end
    else
      render("user_library_tracks/new.html.erb")
    end
  end

  def edit
    @user_library_track = UserLibraryTrack.find(params[:id])

    render("user_library_tracks/edit.html.erb")
  end

  def update
    @user_library_track = UserLibraryTrack.find(params[:id])

    @user_library_track.song_id = params[:song_id]
    @user_library_track.song_name = params[:song_name]
    @user_library_track.song_artist = params[:song_artist]
    @user_library_track.song_attributes = params[:song_attributes]
    @user_library_track.number_of_listens = params[:number_of_listens]
    @user_library_track.genre = params[:genre]
    @user_library_track.last_listened_to_date = params[:last_listened_to_date]
    @user_library_track.song_release_date = params[:song_release_date]
    @user_library_track.liked = params[:liked]

    save_status = @user_library_track.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_library_tracks/#{@user_library_track.id}/edit", "/update_user_library_track"
        redirect_to("/user_library_tracks/#{@user_library_track.id}", :notice => "User library track updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User library track updated successfully.")
      end
    else
      render("user_library_tracks/edit.html.erb")
    end
  end

  def destroy
    @user_library_track = UserLibraryTrack.find(params[:id])

    @user_library_track.destroy

    if URI(request.referer).path == "/user_library_tracks/#{@user_library_track.id}"
      redirect_to("/", :notice => "User library track deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User library track deleted.")
    end
  end
end
