# Staff people 1:<->:n (Developer, Staff)
class Staff < ActiveRecord::Base
  has_many :members, as: :target
  has_one :jobkind, as: :jobkindable

  validates :skill, presence: true
end
