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

    Topic.where(:state => "scheduled").each do |scheduled_topic|
      @topic = scheduled_topic
      @offer = scheduled_topic.offers.find(:first, :conditions => [ "state = ?", "accepted"])
      Appointment.create(:place => @offer.suggested_place, :date_and_time => @offer.suggested_datetime, :helper_id => @offer.user.id, :helpee_id => @topic.user.id, :topic_id => @topic.id)
    end
  end
end
