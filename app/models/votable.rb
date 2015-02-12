module Votable 

  def self.included(base)
    base.after_save :add_author_vote
    base.has_many :votes, as: :votable
    base.has_one :rank_score, as: :rankable
  end

  def score
    votes.reduce(0) { |sum, vote| sum + vote.value }
  end

  def calculate_rank_score
    (score - 1) / (age_in_hours + 2)**1.8
  end

  def age_in_hours
    (Time.now - created_at).to_i / 3600
  end

  def add_author_vote
    user.upvote!(self)
  end

  def recalculate_rank_score
    if rank_score
      rank_score.update_attribute(:value, calculate_rank_score)
    else
      create_rank_score( { value: calculate_rank_score } )
    end
  end

  def rank_score_value
    rank_score.value
  end
end