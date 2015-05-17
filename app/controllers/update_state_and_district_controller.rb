class UpdateStateAndDistrictController < ApplicationController
  include Wicked::Wizard
  
  steps :update_state

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update(update_state_and_district_params)
    render_wizard @user
  end

  def finish_wizard_path
    user_path(current_user)
  end

  private
    def update_state_and_district_params
      params.require(:user).permit(:state, :district)
    end
end
