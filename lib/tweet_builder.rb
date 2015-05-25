class TweetBuilder
  SENATOR_PLACEHOLDER = "@YourSenatorsHere"
  REPRESENTATIVE_PLACEHOLDER = "@YourRepresentativeHere"

  def initialize(user, tweet_text)
    @tweet_text = tweet_text
    @user = user
  end

  def build_for(recipient)
    handles = get_handles
    tweet = recipient == :all ? "#{@tweet_text} #{handles[:senators]} #{handles[:representative]}" : "#{@tweet_text} #{handles[recipient]}"
    return tweet.split.join(" ")
  end

  private 
    def get_handles
      user_congress_members = CongressMemberFinder.get_all(@user)
      {
        senators: format_senator_handles(user_congress_members[:senators]),
        representative: format_representative_hanlde(user_congress_members[:representative])
      }
    end

    def format_senator_handles(senators)
      senators.map { |senator| senator.twitter_handle }.join(" ") if senators
    end

    def format_representative_hanlde(representative)
      representative ? representative.twitter_handle : ""
    end
end