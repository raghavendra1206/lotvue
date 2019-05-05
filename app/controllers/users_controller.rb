class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy,:add_meta_data]

  # GET /users
  # GET /users.json
  def index
    @user = User.new
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @errors = @user.errors
        format.js
      else
        @errors = @user.errors.try(:full_messages)
        format.js
      end
      @user = User.new
      @users = User.all
    end
  end

  def create_meta_data
    @user_info = UserInfo.new(data_type: params[:data_type],value: params[:value],user_id: params[:user_id])
    respond_to do |format|
      if @user_info.save
        @errors = @user_info.errors
        format.js
      else
        @errors = @user_info.errors.try(:full_messages)
        format.js
      end
      @user = User.find(params[:id])
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    @user = User.new
    respond_to do |format|
      @users = User.all
      format.js
    end
  end


  def add_meta_data 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:role_id, :last_name, :first_name, :email,:photos)
    end
end
