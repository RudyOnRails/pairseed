class Appointment < ActiveRecord::Base
  attr_accessible :date_and_time, :helpee_id, :helper_id, :topic_id, :place

  belongs_to :topic

  state_machine :initial => :scheduled do

    after_transition :on => :cancel, :do => :send_cancel_email

    event :cancel do
      transition [:scheduled] => :cancelled
    end

  end

  def send_cancel_email
    AppointmentMailer.cancel_appointment(self.id).deliver
  end

end
