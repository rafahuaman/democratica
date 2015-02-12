class Comment < ActiveRecord::Base
  include Votable
  acts_as_tree order: 'created_at DESC'
  belongs_to :user
  belongs_to :rally
  validates :rally, presence: true
  validates :user, presence: true
  validates :body, presence: true, length: { maximum: 5000 }
  
  def vote_type
    self.class.name
  end
end
