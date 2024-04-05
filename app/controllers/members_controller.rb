class MembersController < AuthorizedController
    def index
        @members = @current_organization.members
    end

    def new
        @member = Member.new
    end

    def edit
        @member = @current_organization.members.find(params[:id])
    end

    def update 
        @member = @current_organization.members.find(params[:id])
        p member_params
        @member.update(member_params)
        if @member.valid?
            redirect_to organization_path(@current_organization)
      end
    end

    def invite 
        email = params[:email]
        return redirect_to organization_path(@current_organization), alert: 'No email provided' if email.blank?
        user = User.find_by(email: email) || User.invite!({ email: email}, current_user)
        return redirect_to organization_path(@current_organization), alert: 'Email invalid' unless user.valid?
        user.members.find_or_create_by(organization: @current_organization, roles: {admin: false, editor: false, viewer: true})
        redirect_to organization_path(@current_organization), notice: "#{email} invited"
    end

    private
    def member_params
        params.require(:member).permit(:user_id, :organization_id, :roles)
    end
end
