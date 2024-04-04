class SongsController < AuthorizedController
    def index
        @songs = @current_organization.songs
    end

    def show
        @song = @current_organization.songs.find(params[:id])
        @people = @song.keys.includes(:person)
        @tags = @song.song_tags.includes(:tag)
        session[:last_visited_show_page] = request.original_url
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
        @song.transaction do 
            @song.keys.each do |key|
                key.destroy
            end
            @song.song_tags.each do |tag|
                tag.destroy
            end
            if @song.destroy
                redirect_to organization_songs_path(@current_organization), notice: "Song and associated keys were successfully deleted."
            else
                redirect_to organization_songs_path(@current_organization), alert: "Failed to delete song and associated keys."
            end
        end
    end

    private
    def song_params
        params.require(:song).permit(:song_name, :organization_id)
    end
end
