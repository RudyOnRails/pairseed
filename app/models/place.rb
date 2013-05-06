class Place < ActiveRecord::Base
  attr_accessible :nickname, :street, :city, :country
end
