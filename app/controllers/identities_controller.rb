class IdentitiesController < ApplicationController
  def index
  end
  
  def create
    #current_user.identity.build(provider: auth_hash["provider"], uid: auth_hash["uid"])
    redirect_to root_url, notice: "Authentication successful."
  end
  
  def destroy
  end

  def failure
    redirect_to root_url, alert: "Twitter account sync failed."
  end

private
  def auth_hash
    request.env['omniauth.auth']
  end
end