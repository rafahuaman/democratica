class IdentitiesController < ApplicationController
  def index
    @identity = current_user.identity
  end
  
  def create
    current_user.create_identity(provider: auth_hash["provider"], 
      uid: auth_hash["uid"], 
      access_token: auth_hash['credentials'].token,
      access_secret: auth_hash['credentials'].secret)
    redirect_to root_url, notice: "You have successfully completed your profile"
  end
  
  def destroy
    current_user.identity.destroy
    flash[:notice] = "Successfully destroyed identity."
    redirect_to identities_url
  end


  def failure
    redirect_to root_url, alert: "Twitter account sync failed."
  end

private
  def auth_hash
    request.env['omniauth.auth']
  end
end