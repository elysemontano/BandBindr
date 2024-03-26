class PeopleController < AuthorizedController
    def index
        @people = @current_organization.people
    end

    def show
        @person = @current_organization.people.find(params[:id])
        @songs = @person.keys.includes(:song)
    end
end
