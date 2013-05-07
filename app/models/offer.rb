class Offer < ActiveRecord::Base
  attr_accessible :message, :suggested_datetime, :topic_id, :suggested_place, :user_id
  belongs_to :topic
  belongs_to :user

  state_machine :initial => :active do
    event :accept do
      transition [:active] => :accepted
    end

    event :decline do
      transition [:active] => :declined
    end
  end

end
