class AppointmentsController < ApplicationController
  def index
    @my_appointments = Appointment.scheduled.where("helper_id = ? OR helpee_id = ?", current_user.id, current_user.id)
    @my_cancelled_appointments = Appointment.cancelled.where("helper_id = ? OR helpee_id = ?", current_user.id, current_user.id)
  end

  def cancel
    @appointment = Appointment.find(params[:id])
    @appointment.cancel
    @appointment.topic.cancel_appointment
    @appointment.offer.cancel_appointment
    redirect_to :back
  end
end
