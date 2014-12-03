class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :rally

  validates :rally, presence: true
  validates :user, presence: true
  validates :body, presence: true, length: { maximum: 5000 }
end
