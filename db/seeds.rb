Organization.delete_all
Topic.delete_all
User.delete_all
Membership.delete_all
Offer.delete_all

kevin = User.create(:first_name => "Kevin", :last_name => "Musiorski", :email => "rudyonrails@gmail.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "RudyOnRails")
helper = User.create(:first_name => "Helper", :last_name => "McGee", :email => "helper@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "i_help_you")
neal = User.create(:first_name => "Neal", :last_name => "Sales-Griffin", :email => "neal@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "Godfather")
vince = User.create(:first_name => "Vince", :last_name => "Cabansag", :email => "vince@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "Vince123")
zach = User.create(:first_name => "Zach", :last_name => "Zuber", :email => "zach@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "zzuber")
arvin = User.create(:first_name => "Arvin", :last_name => "Dang", :email => "arvin@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "danger")
alex = User.create(:first_name => "Alex", :last_name => "Soble", :email => "alex@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "asoble")
fahad = User.create(:first_name => "Fahad", :last_name => "Sami", :email => "fahad@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "fahad")
fonso = User.create(:first_name => "Alfonso", :last_name => "Rush", :email => "fonso@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "thefonso")
cullen = User.create(:first_name => "Tom", :last_name => "Cullen", :email => "cullen@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "cullen")
t_bone = User.create(:first_name => "Tom", :last_name => "Brown", :email => "tom_brown@pairseed.com", :password => "pairseed", :password_confirmation => "pairseed", :username => "t_bone")

kevin1 = kevin.topics.create(:title => "Looking to get started with FactoryGirl.")
kevin.topics.create(:title => "if anyone has any experience with the google calendar API and would like to pair up and play around, give me a shout.")
fonso.topics.create(:title => "Error R11 (Bad bind) -> Process bound to port 3000, should be 12776")
fonso.topics.create(:title => "I'm trying to figure out what this font is.")
fonso.topics.create(:title => "Has anyone had experience with turn.js ?")
t_bone.topics.create(:title => "Looking to go over the basics of git.")

offer1 = kevin1.offers.create(:user_id => fonso.id, :suggested_datetime => Time.now + 2.days, :message => "I can help!", :suggested_place => "1871")
offer2 = kevin1.offers.create(:user_id => helper.id, :suggested_datetime => Time.now + 1.days, :message => "I can help!", :suggested_place => "Starbucks @ Chicago/Franklin")
offer3 = kevin1.offers.create(:user_id => neal.id, :suggested_datetime => Time.now + 3.hours, :message => "Hey Rudy, I want to get started with FactoryGirl too. Love, Neal.", :suggested_place => "37 Signals HQ")
offer4 = kevin1.offers.create(:user_id => vince.id, :suggested_datetime => Time.now + 45.minutes, :message => "Hey Rudy, let's do this.", :suggested_place => "TSL Design Classroom")

kevin.places.create(:nickname => "C&C Starbucks", :street => "750 North Franklin Street", :city => "Chicago", :country => "USA")
kevin.places.create(:nickname => "Tinley Starbucks", :street => "15901 South Harlem Avenue", :city => "Chicago", :country => "USA")
kevin.places.create(:nickname => "TP Library", :street => "7851 Timber Drive", :city => "Tinley Park", :country => "USA")
kevin.places.create(:nickname => "1871", :street => "222 West Merchandise Mart Plaza Ste 1212", :city => "Chicago", :country => "USA")


tsl = Organization.create do |o|
  o.name = 'The Starter League'
  o.description = 'Learn to code, design & ship web apps at the best beginner-focused software school in the world.'
  o.url = 'http://www.starterleague.com'
  o.logo_image = File.open("/Users/rudyonrails/Dropbox/pairseed_demo_files/starter_league_logo.png")
end

chiruby = Organization.create do |o|
  o.name = 'Chicago Ruby'
  o.description = 'ChicagoRuby is a group of Ruby on Rails enthusiasts with events in downtown Chicago and the suburbs.'
  o.url = 'http://www.chicagoruby.org/'
  o.logo_image = File.open("/Users/rudyonrails/Dropbox/pairseed_demo_files/chicago_ruby_logo.jpeg")
end

dev_bootcamp = Organization.create do |o|
  o.name = 'Dev Bootcamp'
  o.description = 'Learn Ruby on Rails in 9 weeks.'
  o.url = "http://devbootcamp.com/"
  o.logo_image = File.open("/Users/rudyonrails/Dropbox/pairseed_demo_files/devbootcamp_logo.png")
end

# # addresses = ["222 W Ontario", "141 W Jackson", "1937 W Diversey", "2922 N Clark", "758 N Larabee"]
# # chunk = 1
# # question_titles.each do |question_title|
# #   PairTopic.create do |pt|  
# #     pt.title = question_title
# #     pt.street = addresses.sample
# #     pt.city = "Chicago"
# #     pt.country = "USA"
# #     pt.user_id = User.last.id
# #     pt.created_at = Time.now - chunk.hours
# #   end
# #   chunk += 1
# # end

User.find_each do |user|
  Membership.create(:user_id => user.id, :organization_id => tsl.id)
end
