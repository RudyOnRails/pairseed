class Topic < ActiveRecord::Base
  attr_accessible :title, :description
  acts_as_taggable_on :subjects

  belongs_to :user
  has_many :offers
  has_one :appointment

  state_machine :initial => :active do
    event :schedule do
      transition [:active] => :scheduled
    end
  end

  def self.pairable
    where(:state => :active)
  end

end