class Building < ActiveRecord::Base
  
  belongs_to :user
  has_one :ad

end
