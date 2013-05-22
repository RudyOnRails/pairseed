class AddAppointmentIdToScreenshares < ActiveRecord::Migration
  def change
    add_column :screenshares, :appointment_id, :integer
  end
end
