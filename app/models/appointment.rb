class Appointment < ActiveRecord::Base
  attr_accessible :date_and_time, :helpee_id, :helper_id, :topic_id, :place
end
