class Bicycle < ActiveRecord::Base
  has_many :wheels
  has_many :suspensions
end
