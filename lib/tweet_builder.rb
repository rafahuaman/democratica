class TweetBuilder
  SENATOR_PLACEHOLDER = "@YourSenatorHere"
  REPRESENTATIVE_PLACEHOLDER = "@YourRepresentativeHere"

  def initialize(user, tweet_text)
    @tweet_text = tweet_text
    @user = user
  end

  def build_for(recipient)
    handles = get_handles
    tweet = recipient == :all ? "#{@tweet_text} #{handles[:senator]} #{handles[:representative]}" : "#{@tweet_text} #{handles[recipient]}"
    return tweet.split.join(" ")
  end

  private 
    def get_handles
      user_congress_members = CongressMemberFinder.get_all(@user)
      {
        senator: user_congress_members[:senator] ? user_congress_members[:senator].twitter_handle : "",
        representative: user_congress_members[:representative] ? user_congress_members[:representative].twitter_handle : ""
      }
    end
end