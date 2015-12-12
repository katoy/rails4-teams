# Team  team 1:<->:n member
class Team < ActiveRecord::Base
  has_many :members
  accepts_nested_attributes_for :members, allow_destroy: true

  validates :members, presence: true
end
