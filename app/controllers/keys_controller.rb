class KeysController < AuthorizedController
  def new
      if params[:song_id]
          @song = Song.find(params[:song_id])
          @people = @current_organization.people.all
          @people_collection = @people.map { |person| [person.first_name, person.last_name, person.id] }
      elsif params[:person_id]
          @person = Person.find(params[:person_id])
          @songs = @current_organization.songs.all
          @songs_collection = @songs.map { |song| [song.song_name, song.id] }
      end
      @key = Key.new
  end

  def create
    @key = Key.create(key_params)
    if @key.valid?
      if params[:song_id]
        @song = Song.find(params[:song_id])
        redirect_to organization_song_path(@current_organization, @song)
      elsif params[:person_id]
        @person = Person.find(params[:person_id])
        redirect_to organization_person_path(@current_organization, @person)
      else
        redirect_to root_path
      end
    else
      render :new
    end
  end

  def destroy
    @key = Key.find(params[:id])
    if @key.destroy
      redirect_to stored_last_visited_show_page || root_path
    else
      flash[:alert] = 'Failed to delete key.'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def key_params
      params.require(:key).permit(:song_key, :person_id, :song_id)
  end

  def stored_last_visited_show_page
    session[:last_visited_show_page]
  end
end
