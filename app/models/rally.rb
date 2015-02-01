class Rally < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable
  validates :title, presence: true, length: { maximum: 300 }
  validates :content, presence: true, length: { maximum: 5000 }
  validates :twitter_template, presence: true, length: { maximum: 140 }

  def vote_type
    self.class.name
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

  def root_comments
    Comment.where(rally_id: id, parent_id: nil)
  end
end
