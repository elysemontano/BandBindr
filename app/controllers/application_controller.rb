class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_current_organization

    helper_method :current_organization

    def redirect_to_organization
        if user_signed_in? && current_user.last_used_organization_id.present?
          redirect_to organization_path(current_user.last_used_organization_id)
        else
          redirect_to static_pages_landing_page_path
        end
    end

    def set_current_organization
        @current_organization = Organization.find_by(id: params[:id])
        if @current_organization
            current_user.update(last_used_organization_id: @current_organization.id)
        end
    end
    
    def current_organization
        @current_organization
    end
end
