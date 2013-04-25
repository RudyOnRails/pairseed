class AddPlaceToPairOffer < ActiveRecord::Migration
  def change
    add_column :pair_offers, :pair_place, :string
  end
end
