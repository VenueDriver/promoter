class EventSelect

  def self.tag
    tag = nil
    unless tag = Rails.cache.read('events')
      tag = self.load
    end
    return tag
  end
  
  def self.refresh
    Rails.cache.delete('events')
  end

private

  def self.load
    # REST API call to get HTML for a select tag containing an event list.
    require 'uri'
    require 'net/http'
    url = "http://venuedriver.com/api/venues/#{VENUE_DRIVER[:venue_id]}/events/select_tag.html?username=#{VENUE_DRIVER[:username]}&password=#{VENUE_DRIVER[:password]}"
    if ENV['RAILS_ENV'].eql? 'development' or ENV['RAILS_ENV'].eql? 'test'
      url = "http://localhost:3000/api/venues/410591471/events/select_tag.html?username=ryan&password=password"
    end

    response = Net::HTTP.get_response(URI.parse(url))
    if(response.code.eql? '200')
      Rails.cache.write('events', response.body, :expires_in => 24.hours)
      return response.body
    end
  end
  
end