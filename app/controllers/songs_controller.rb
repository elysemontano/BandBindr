class SongsController < AuthorizedController
    def index
        @songs = @current_organization.songs
    end

    def show
        @song = @current_organization.songs.find(params[:id])
        @people = @song.keys.includes(:person)
    end

    def new
        @song = Song.new
    end

    def create
        @song= @current_organization.songs.create(song_params)
        if @song.valid?
            redirect_to organization_songs_path(@current_organization)
        end
    end

    def edit
        @song = @current_organization.songs.find(params[:id])
    end

    def update 
        @song = @current_organization.songs.find(params[:id])
        @song.update(song_params)
        if @song.valid?
            redirect_to organization_songs_path(@current_organization)
      end
    end

    def destroy
        @song = @current_organization.songs.find(params[:id])
        if @song.destroy
            redirect_to organization_songs_path(@current_organization)
        end
    end

    private
    def song_params
        params.require(:song).permit(:song_name, :organization_id)
    end
end
