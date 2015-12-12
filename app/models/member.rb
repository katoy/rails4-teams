# Member team 1:<->:n member
class Member < ActiveRecord::Base
  belongs_to :team, inverse_of: :members

  validates :team, presence: true
end
