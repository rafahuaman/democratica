class Rally < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: { maximum: 300 }
  validates :content, presence: true, length: { maximum: 5000 }
  validates :twitter_template, presence: true, length: { maximum: 140 }
end
