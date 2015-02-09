module Votable 

  def self.included(base)
    base.after_save :add_author_vote
  end

  def score
    votes.reduce(0) { |sum, vote| sum + vote.value }
  end

  def rank_score
    (score - 1) / (age_in_hours + 2)**1.8
  end

  def age_in_hours
    (Time.now - created_at).to_i / 3600
  end

  def add_author_vote
    user.upvote!(self)
  end
end