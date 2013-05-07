class AddStateToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :state, :string
    Offer.all.each do |offer|
      offer.state = "active"
      offer.save
    end
  end
end
