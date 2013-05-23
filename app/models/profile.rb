class Profile < ActiveRecord::Base
  attr_accessible :summary
  belongs_to :user
end
