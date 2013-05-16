class ChangeActiveOffersToAcceptable < ActiveRecord::Migration
  def up
    Offer.where(:state => "active").each do |active_offer|
      active_offer.update_attribute(:state, "acceptable")
    end
  end

  def down
    Offer.where(:state => "acceptable").each do |acceptable_offer|
      acceptable_offer.update_attribute(:state, "active")
    end
  end
end
