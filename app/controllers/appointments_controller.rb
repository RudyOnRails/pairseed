class AppointmentsController < ApplicationController
  def index
    @my_appointments = Appointment.where("helper_id = ? OR helpee_id = ?", current_user.id, current_user.id)
  end
end
