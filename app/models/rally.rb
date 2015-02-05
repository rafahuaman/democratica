class Rally < ActiveRecord::Base
  include Votable
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable
  validates :title, presence: true, length: { maximum: 300 }
  validates :content, presence: true, length: { maximum: 5000 }
  validates :twitter_template, presence: true, length: { maximum: 140 }

  def vote_type
    self.class.name
  end

  def root_comments
    Comment.where(rally_id: id, parent_id: nil)
  end

end
