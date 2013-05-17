class Topic < ActiveRecord::Base
  attr_accessible :title, :description
  acts_as_taggable_on :subjects

  belongs_to :user
  has_many :offers
  has_one :appointment

  state_machine :initial => :unoffered do
    event :schedule do
      transition [:unoffered] => :scheduled
    end

    event :offer_help do
      transition [:unoffered] => :offered
    end
  end

  def self.pairable
    where(:state => :unoffered)
  end

end