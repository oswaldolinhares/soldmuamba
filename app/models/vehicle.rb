class Vehicle < ActiveRecord::Base

  has_one :ad
  belongs_to :user

  #accepts_nested_attributes_for :user # not sure if this is needed
end
