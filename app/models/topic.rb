class Topic < ActiveRecord::Base
  scope :offered, -> { where(:state => "offered") }

  attr_accessible :title, :description
  acts_as_taggable_on :subjects

  belongs_to :user
  has_many :offers
  has_one :appointment

  state_machine :initial => :unoffered do
    event :offer_help do
      transition [:unoffered] => :offered
    end    

    event :schedule do
      transition [:offered] => :scheduled
    end

    event :cancel_appointment do
      transition [:scheduled] => :unoffered
    end
  end

  def self.offerable
    where(:state => :unoffered)
  end

  def offerable
    self.state == ("unoffered" || "offered")
  end

end