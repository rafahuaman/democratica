class CongressMember < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :district, uniqueness: { scope: [:state], message: "This state's district is already taken." } 
  validates :state, length: { maximum: 2 }
  validates :type, presence: true, inclusion: { in: %w(Representative Senator),
    message: "%{value} is not a valid Type" }

  def full_name
    self.first_name + " " + self.last_name
  end
  
  def name_with_title
    self.type + " " + full_name
  end

  def representative?
    type == Representative.name 
  end
  
  def senator?
    type == Senator.name
  end
end

class Representative < CongressMember
end

class Senator < CongressMember
end