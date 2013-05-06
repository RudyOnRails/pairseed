class Offer < ActiveRecord::Base
  attr_accessible :message, :suggested_datetime, :topic_id, :suggested_place, :user_id
  belongs_to :topic
  belongs_to :user
end
