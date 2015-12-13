# Team  team 1:<->:n member
class Team < ActiveRecord::Base
  has_many :members
  accepts_nested_attributes_for :members, allow_destroy: true, reject_if: :all_blank

  # validates :members, presence: true
  validates :name, presence: true
end
