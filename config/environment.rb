# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PairSeed::Application.initialize!

Time::DATE_FORMATS[:default] = lambda do |time|
  time.strftime("%A, %B #{time.day.ordinalize} @ %-l:%M%P")
end