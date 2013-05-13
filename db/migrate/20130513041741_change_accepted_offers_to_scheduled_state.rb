class ChangeAcceptedOffersToScheduledState < ActiveRecord::Migration
  def up
    Offer.where(:state => "accepted").each do |accepted_offer|
      accepted_offer.update_attribute(:state, "scheduled")
    end
  end

  def down
    Offer.where(:state => "scheduled").each do |scheduled_offer|
      scheduled_offer.update_attribute(:state, "accepted")
    end
  end
end
