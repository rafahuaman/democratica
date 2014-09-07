class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_state, :add_congressional_district

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    #@user.update(user_params)
    @user.update(after_signup_params)
    render_wizard @user
  end

  def finish_wizard_path
    flash[:notice] = "You have successfully completed your profile"
    root_url #user_path(current_user)
  end


  private
    def after_signup_params
      params.require(:user).permit(:state, :district)
    end
end
