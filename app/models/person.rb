# people 1:<->:n (Developer, Staff)
class Person < ActiveRecord::Base
  has_many :jobkinds, dependent: :destroy

  has_many :active_relationships, class_name:  'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  default_scope -> { order(created_at: :asc) }

  validates :name, presence: true
  validates :age, presence: true
  validates :mail, presence: true

  # person をフォローする
  def follow(other_person)
    active_relationships.create(followed_id: other_person.id)
  end

  # person をアンフォローする
  def unfollow(other_person)
    active_relationships.find_by(followed_id: other_person.id).destroy
  end

  # 現在の person がフォローしてたら true を返す
  def following?(other_person)
    following.include?(other_person)
  end
end
