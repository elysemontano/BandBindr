class MembersController < ApplicationController
    before_action :set_current_organization
    def index
        @members = @current_organization.members
    end

    def invite 
        email = params[:email]
        return redirect_to organization_members_path(@current_organization), alert: 'No email provided' if email.blank?
        user = User.find_by(email: email) || User.invite!({ email: email}, current_user)
        return redirect_to organization_members_path(@current_organization), alert: 'Email invalid' unless user.valid?
        user.members.find_or_create_by(organization: @current_organization, roles: {admin: false, editor: true})
        redirect_to organization_members_path(@current_organization), notice: "#{email} invited"
    end

    private
    def set_current_organization
        @current_organization = Organization.find(params[:organization_id])
    end
end
