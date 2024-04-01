# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    if resource.last_used_organization_id.present?
      # Set the last used organization ID in the session
      session[:last_used_organization_id] = resource.last_used_organization_id
      # Redirect the user to some page where they can continue their work
      organization_path(resource.last_used_organization_id)
    else
      # If no last used organization, redirect to a default page
      root_path
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
