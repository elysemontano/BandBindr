class TagsController < AuthorizedController
    def index
        @tags = @current_organization.tags
    end

    def show
        @tag = @current_organization.tags.find(params[:id])
        @songs = @tag.song_tags.includes(:song)
        session[:last_visited_show_page] = request.original_url
    end

    def new
        @tag = Tag.new
    end

    def create
        @tag = @current_organization.tags.create(tag_params)
        if @tag.valid?
            redirect_to organization_tags_path(@current_organization)
        end
    end

    def edit
        @tag = @current_organization.tags.find(params[:id])
    end

    def update 
        @tag = @current_organization.tags.find(params[:id])
        @tag.update(tag_params)
        if @tag.valid?
            redirect_to organization_tags_path(@current_organization)
      end
    end

    def destroy
        @tag = @current_organization.tags.find(params[:id])
        @tag.transaction do 
            @tag.song_tags.each do |song_tag| 
                song_tag.destroy
            end
            if @tag.destroy
                redirect_to organization_tags_path(@current_organization), notice: "Tag and associated song tags were successfully deleted."
            else
                redirect_to organization_tags_path(@current_organization), alert: "Failed to delete tag."
            end
        end
    end

    private
    def tag_params
        params.require(:tag).permit(:tag_word, :organization_id)
    end
end
