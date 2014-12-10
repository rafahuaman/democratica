class Comment < ActiveRecord::Base
  acts_as_tree order: 'created_at DESC'
  belongs_to :user
  belongs_to :rally

  validates :rally, presence: true
  validates :user, presence: true
  validates :body, presence: true, length: { maximum: 5000 }
end
