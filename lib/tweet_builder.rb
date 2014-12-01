class TweetBuilder

  def initialize(user, tweet_text)
    @tweet_text = tweet_text
    @congress_members = CongressMemberFinder.get_all(user)
  end

  def build_for(recipient)
    return "#{@congress_members[:senator].twitter_handle} #{@congress_members[:representative].twitter_handle} #{@tweet_text}" if recipient == :all 
    return "#{@congress_members[recipient].twitter_handle} #{@tweet_text}"
  end
end