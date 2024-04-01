module OrganizationsHelper
    def organizations 
        @organizations = current_user.organizations
    end
end
