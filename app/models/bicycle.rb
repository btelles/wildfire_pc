class Bicycle < ActiveRecord::Base
  has_many :wheels
  has_many :suspensions

  accepts_nested_attributes_for :suspensions, :wheels
end
