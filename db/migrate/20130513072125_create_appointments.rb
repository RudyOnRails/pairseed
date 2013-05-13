class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date_and_time
      t.integer :helper_id
      t.integer :helpee_id
      t.integer :topic_id
      t.string :place

      t.timestamps
    end
  end
end
