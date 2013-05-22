class AddOnlineToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :online, :boolean
  end
end
