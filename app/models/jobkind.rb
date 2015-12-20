# people 1:<->:n (Developer, Staff)
class Jobkind < ActiveRecord::Base
  extend Enumerize

  enumerize :jobkindable_type, in: [:Developer, :Staff]

  belongs_to :jobkindable, polymorphic: true
  belongs_to :person

  default_scope -> { order(created_at: :asc) }

  validates :jobkindable_type, presence: true
  validates :jobkindable_id, presence: true
end
