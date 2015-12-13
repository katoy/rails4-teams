class Developer < ActiveRecord::Base
  has_many :members, as: :target
end
