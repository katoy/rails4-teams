# people 1:<->:n (Developer, Staff)
class Relationship < ActiveRecord::Base
  has_many :jobkinds, dependent: :destroy

  belongs_to :follower, class_name: 'Person'
  belongs_to :followed, class_name: 'Person'

  default_scope -> { order(created_at: :asc) }

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
