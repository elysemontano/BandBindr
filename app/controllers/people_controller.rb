class PeopleController < AuthorizedController
    def index
        query = params[:query]

        # Filter the songs based on the query if present
        if query.present? || query == ""
          @people = @current_organization.people.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{query}%", "%#{query}%")
          p @people
            render partial: 'people/search_results', locals: { people: @people }
        else
            @people = @current_organization.people.order(:first_name)
            render :index
        end
      end
      

    def show
        @person = @current_organization.people.find(params[:id])
        @songs = @person.keys.includes(:song).order('songs.song_name')
        session[:last_visited_show_page] = request.original_url
    end

    def new
        @person = Person.new
    end

    def create
        @person = @current_organization.people.create(person_params)
        if @person.valid?
            redirect_to organization_people_path(@current_organization)
        end
    end

    def edit
        @person = @current_organization.people.find(params[:id])
    end

    def update 
        @person = @current_organization.people.find(params[:id])
        @person.update(person_params)
        if @person.valid?
            redirect_to organization_people_path(@current_organization)
      end
    end

    def destroy
        @person = @current_organization.people.find(params[:id])
        @person.transaction do
          @person.keys.each do |key|
            key.destroy
          end
          if @person.destroy
            redirect_to organization_people_path(@current_organization), notice: "Person and associated songs were successfully deleted."
          else
            redirect_to organization_people_path(@current_organization), alert: "Failed to delete person and associated songs."
          end
        end
    end
      

    private
    def person_params
        params.require(:person).permit(:first_name, :last_name, :organization_id)
    end
end
