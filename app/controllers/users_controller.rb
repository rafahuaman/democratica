class UsersController < ApplicationController
  before_action :check_signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :check_admin_user, only: [:destroy]
  before_action :check_correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :delete]
  

  def new
    @user = User.new
  end

  def show
    user_congress_members = CongressMemberFinder.get_all(@user)
    @representative_name = user_congress_members[:representative] ? user_congress_members[:representative].full_name : "Complete your profile!"
    if user_congress_members[:senators]
      @first_senator_name = user_congress_members[:senators][0] ? user_congress_members[:senators][0].full_name : "Complete your profile!"
      @second_senator_name = user_congress_members[:senators][1] ? user_congress_members[:senators][1].full_name : "Complete your profile!"
    else
      @first_senator_name = "Complete your profile!"
      @second_senator_name = "Complete your profile!"
    end
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          sign_in @user
          redirect_to user_after_signup_path(user_id: @user.id, id: :add_state), notice: 'User was successfully created.' 
        end
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation, :state, :district)
    end

    def check_correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end
