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
          song_id = key_params[:song_id]
          person_id = key_params[:person_id]
      
          if song_id.present?
            @song = Song.find(song_id)
            redirect_to organization_song_path(@current_organization, @song)
          elsif person_id.present?
            @person = Person.find(person_id)
            redirect_to organization_person_path(@current_organization, @person)
          else
            flash[:alert] = 'There was a problem creating the key.'
          end
        end
      end

    def destroy
        session[:return_to] = request.referer
        @key = Key.find(params[:id])
        if @key.destroy
            redirect_to(session.delete(:return_to) || default_path)
        end
    end
      

    private
    def key_params
        params.require(:key).permit(:song_key, :person_id, :song_id)
    end
end
