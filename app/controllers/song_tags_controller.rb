class SongTagsController < SongsController
    include SongTagsHelper
    def new
        @song = @current_organization.songs.find(params[:song_id])
        @song_tag = SongTag.new
    end

    def create
        @song_tag = SongTag.create(song_tag_params)
        @song = @current_organization.songs.find(params[:song_id])
        if @song_tag.valid?
            redirect_to organization_song_path(@current_organization, @song)
        end
    end

    def destroy
        @song_tag = SongTag.find(params[:id])
        @song = @current_organization.songs.find(params[:song_id])
        if @song_tag.destroy
            redirect_to organization_song_path(@current_organization, @song)
        end
    end

    private 
    def song_tag_params 
        params.require(:song_tag).permit(:song_id, :tag_id)
    end
end
