class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def change_password
      @user = current_user
    end
  
    def update_password
      @user = current_user
      if @user.update_with_password(user_params)
        bypass_sign_in(@user) # Sign in the user again to update the session
        redirect_to root_path, notice: "Password updated successfully."
      else
        render :change_password
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
  end
  