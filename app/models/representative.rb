class Representative < ActiveRecord::Base
  before_save { self.district = district.downcase }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :district, presence: true, length: { maximum: 4 }, uniqueness: { case_sensitive: false }
  validates :state, length: { maximum: 2 }
end
