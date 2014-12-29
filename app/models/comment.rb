class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC'
  belongs_to :user
  belongs_to :rally
  has_many :votes, as: :votable
  validates :rally, presence: true
  validates :user, presence: true
  validates :body, presence: true, length: { maximum: 5000 }

  def vote_type
    self.class.name
  end

  def score
    self.votes.reduce(0) { |sum, vote| sum + vote.value }
  end
end
