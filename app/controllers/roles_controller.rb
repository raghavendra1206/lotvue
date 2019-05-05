class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  # after_action :set_variables, only:[:create]
  # GET /roles
  # GET /roles.json
  def index
    @role = Role.new
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        @errors = @role.errors
        format.js
      else
        @errors = @role.errors.try(:full_messages)
        format.js
      end
    end
    @role = Role.new
    @roles = Role.all
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    @role = Role.new
    respond_to do |format|
      @roles = Role.all
      format.js
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name,:is_default)
    end
end
