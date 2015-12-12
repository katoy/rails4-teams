# Member team 1:<->:n member
class Member < ActiveRecord::Base
  belongs_to :team

  validates :team, presence: true
end
