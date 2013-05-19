class Offer < ActiveRecord::Base
  attr_accessible :message, :suggested_datetime, :topic_id, :suggested_place, :user_id
  belongs_to :topic
  belongs_to :user
  has_one :appointment

  state_machine :initial => :acceptable do
    event :accept do
      transition [:acceptable] => :accepted
    end

    event :decline do
      transition [:acceptable] => :declined
    end
  end

end
