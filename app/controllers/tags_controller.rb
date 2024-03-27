class TagsController < AuthorizedController
    def index
        @tags = @current_organization.tags
    end

    def show
        @tag = @current_organization.tags.find(params[:id])
        @songs = @tag.song_tags.includes(:song)
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
        if @tag.destroy
            redirect_to organization_tags_path(@current_organization)
        end
    end

    private
    def tag_params
        params.require(:tag).permit(:tag_word, :organization_id)
    end
end
