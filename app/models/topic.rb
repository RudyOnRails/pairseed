class Topic < ActiveRecord::Base
  scope :offered, -> { where(:state => "offered") }

  mount_uploader :pic, TopicpicUploader

  attr_accessible :title, :description, :pic, :pair_type_id
  acts_as_taggable_on :subjects

  belongs_to :user
  has_many :offers, :dependent => :destroy
  has_one :appointment, :dependent => :destroy
  belongs_to :pair_type

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
    (self.state == "unoffered") || (self.state == "offered")
  end

end