class PeopleController < AuthorizedController
    def index
        @people = @current_organization.people
    end

    def show
        @person = @current_organization.people.find(params[:id])
        @songs = @person.keys.includes(:song)
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
