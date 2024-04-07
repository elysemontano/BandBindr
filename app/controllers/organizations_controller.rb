class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]
  before_action :authorize_member, only: %i[ show edit update destroy ]

  # GET /organizations or /organizations.json
  def index
    @organizations = current_user.organizations
  end

  # GET /organizations/1 or /organizations/1.json
  def show
    @organizations = current_user.organizations
    @members = @organization.members
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        @organization.members.create(user: current_user, role: "admin")
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organization_url(@organization), notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    @organization.destroy
    current_user.update(last_used_organization_id: nil)

    respond_to do |format|
      format.html { redirect_to organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def authorize_member
      return redirect_to root_path, alert: 'You are not a member' unless @organization.users.include? current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name)
    end
end
