module Votable 
  def score
    votes.reduce(0) { |sum, vote| sum + vote.value }
  end

  def rank_score
    (score - 1) / (age_in_hours + 2)**1.8
  end

  def age_in_hours
    (Time.now - created_at).to_i / 3600
  end
end