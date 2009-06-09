class Guest < ActiveResource::Base

  if ENV['RAILS_ENV'].eql? 'development' or ENV['RAILS_ENV'].eql? 'test'
    self.site = "http://localhost:3000/api"
    self.user = "ryan"
    self.password = "password"
  else
    self.site = "http://venuedriver.com/api"
    self.user = "rokvegassite"
    self.password = "3jznJb75"
  end
  
end
