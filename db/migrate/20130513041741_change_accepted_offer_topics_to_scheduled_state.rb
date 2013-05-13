class ChangeAcceptedOfferTopicsToScheduledState < ActiveRecord::Migration
  def up
    Topic.where(:state => "offer_accepted").each do |topic|
      topic.update_attribute(:state, "scheduled")
    end
  end

  def down
    Topic.where(:state => "scheduled").each do |topic|
      topic.update_attribute(:state, "offer_accepted")
    end
  end
end
