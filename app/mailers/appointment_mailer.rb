class AppointmentMailer < ActionMailer::Base
  # default from: "PairSeed Offers"

  def appointment_reminder(appointment_id)
    @appointment = Appointment.find(appointment_id)
    @helper = User.find(@appointment.helper_id)
    @helpee = User.find(@appointment.helpee_id)
    @topic = Topic.find(@appointment.topic_id)
    @from = "\"PairSeed Appointments\" <notifications@pairseed.com>"
    mail(:from => @from, to: [@helper.email, @helpee.email], subject: "You have a pair appointment today!")
  end

  def cancel_appointment(appointment_id)
    @appointment = Appointment.find(appointment_id)
    @helper = User.find(@appointment.helper_id)
    @helpee = User.find(@appointment.helpee_id)
    @topic = Topic.find(@appointment.topic_id)
    @from = "\"PairSeed Appointments\" <notifications@pairseed.com>"
    mail(:from => @from, to: [@helper.email, @helpee.email], subject: "Your pair appointment has been cancelled :(")
  end
end
