class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_state, :add_congressional_district, :add_twitter

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update(after_signup_params)
    render_wizard @user
  end

  def finish_wizard_path
    root_url
  end


  private
    def after_signup_params
      params.require(:user).permit(:state, :district)
    end
end
