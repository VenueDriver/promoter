class Promoter::PromoterController < ApplicationController
  before_filter :get_events

private

  def get_events

    # REST API call to get HTML for a select tag containing an event list.
    require 'uri'
    require 'net/http'
    url = "http://venuedriver.com/api/venues/181/events/select_tag.html?username=rokvegassite&password=3jznJb75"
    if ENV['RAILS_ENV'].eql? 'development' or ENV['RAILS_ENV'].eql? 'test'
      url = "http://localhost:3000/api/venues/410591471/events/select_tag.html?username=ryan&password=password"
    end

    response = Net::HTTP.get_response(URI.parse(url))
    if(response.code.eql? '200')
      @events = response.body
    end
        
  end

end