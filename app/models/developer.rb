# Developer people 1:<->:n (Developer, Staff)
class Developer < ActiveRecord::Base
  has_many :members, as: :target
  has_one :jobkind, as: :jobkindable

  validates :lang, presence: true
end
