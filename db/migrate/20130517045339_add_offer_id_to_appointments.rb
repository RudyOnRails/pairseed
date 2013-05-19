class AddOfferIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :offer_id, :integer
  end
end
