class TweetsController < ApplicationController
  def new

  end

  def create
    current_user.tweet(twitter_params[:message])
    respond_to do |format|
      format.js
    end
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
