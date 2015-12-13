# Member team 1:<->:n member
class Member < ActiveRecord::Base
  belongs_to :team, inverse_of: :members

  default_scope -> { order(created_at: :asc) }

  validates :team_id, presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :mail, presence: true
end
