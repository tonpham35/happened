class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json

  def home
    @user = User.all

  end

  def index

    @users = User.all
    @searched_users = User.search(params[:search])
    @stories = Story.search(params[:search])
    # @events = Event.search(params[:search])
    # @users = User.search(params[:search])
    # @results = @stories + @events + @users
    # + Event.search(params[:search]) + User.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
    @friend = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    if current_user == User.find(params[:id])
       @user = current_user
    else
      redirect_to root_path
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
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
