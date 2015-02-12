class RankScore < ActiveRecord::Base
  belongs_to :rankable, polymorphic: true
  validates :rankable_id, :value, :rankable_type, presence: true
  validates :rankable_id, uniqueness: { scope: [:rankable_type], message: "There can only be one rank score per rankable object" }
  validates :rankable_type, inclusion: { in: %w(Rally Comment),  message: "%{value} is not a valid Type" }
end