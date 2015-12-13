# Team  team 1:<->:n member
class Team < ActiveRecord::Base
  has_many :members, dependent: :destroy
  accepts_nested_attributes_for :members, allow_destroy: true, reject_if: :all_blank

  default_scope -> { order(name: :asc) }

  validates :members, presence: true
  # validate :count_members_more_than_one
  validates :name, presence: true

  # def count_members_more_than_one
  #   errors.add(:members, 'no member!') if members.size == 0
  # end
end
