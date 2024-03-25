class MembersController < ApplicationController
    before_action :set_current_organization
    def index
        @members = @current_organization.members
    end

    private
    def set_current_organization
        @current_organization = Organization.find(params[:organization_id])
    end
end
