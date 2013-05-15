class AddStateToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :state, :string
    Appointment.all.each do |appointment|
      appointment.update_attribute(:state, "scheduled")
    end
  end
end
