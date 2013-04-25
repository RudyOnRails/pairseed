class PairOffer < ActiveRecord::Base
  attr_accessible :message, :suggested_datetime, :pair_topic_id
  belongs_to :pair_topic
  belongs_to :user
end
