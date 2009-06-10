class Reservation < ActiveResource::Base

  if ENV['RAILS_ENV'].eql? 'development' or ENV['RAILS_ENV'].eql? 'test'
    puts "Looking for Venue Driver on port 3000."
    self.site = "http://localhost:3000/api"
    self.user = "ryan"
    self.password = "password"
  else
    self.site = "http://venuedriver.com/api"
    self.user = VENUE_DRIVER[:username]
    self.password = VENUE_DRIVER[:password]
  end
  
end
