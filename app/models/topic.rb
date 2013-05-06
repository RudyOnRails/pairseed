class Topic < ActiveRecord::Base
  attr_accessible :title, :description
  acts_as_taggable_on :subjects

  belongs_to :user
  has_many :offers

end