class Staff < ActiveRecord::Base

   has_many :members, as: :target
end
