class Offer < ActiveRecord::Base
  attr_accessible :message, :suggested_datetime, :topic_id, :suggested_place, :user_id, :online
  belongs_to :topic
  belongs_to :user
  has_one :appointment

  validates_inclusion_of :online, :in => [true, false]

  state_machine :initial => :acceptable do
    event :accept do
      transition [:acceptable] => :accepted
    end

    event :decline do
      transition [:acceptable] => :declined
    end

    event :cancel_appointment do
      transition [:accepted] => :appointment_cancelled
    end
  end

end
