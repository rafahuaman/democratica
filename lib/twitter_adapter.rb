class TwitterAdapter
  
  def self.tweet(tweet, access_token, access_secret)
     client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_key
      config.consumer_secret     = Rails.application.secrets.twitter_secret
      config.access_token        = access_token
      config.access_token_secret = access_secret
    end
    
    client.update(tweet)
  end
end