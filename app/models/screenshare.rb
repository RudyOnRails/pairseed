class Screenshare < ActiveRecord::Base
  attr_accessible :applet_html, :viewer_url
  belongs_to :appointment
end
