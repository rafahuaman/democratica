class CongressMember < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :district, uniqueness: { scope: [:state], unless: Proc.new { |member| member.district.blank? }, message: "This state's district is already taken." } 
  validates :state, presence: true, length: { maximum: 2 }
  validates :type_by_house, presence: true, inclusion: { in: %w(Representative Senator),
    message: "%{value} is not a valid Type" }

  def self.types
    ["Representative", "Senator"]
  end

  def full_name
    self.first_name + " " + self.last_name
  end
  
  def name_with_title
    self.type_by_house + " " + full_name
  end

  def representative?
    type_by_house == "Representative"
  end
  
  def senator?
    type_by_house == "Senator"
  end
end