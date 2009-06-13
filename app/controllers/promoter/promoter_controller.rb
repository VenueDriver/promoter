class Promoter::PromoterController < ApplicationController
  before_filter :get_events, :only => [:index, :new]

private

  def get_events
    @events = EventSelect.tag    
  end
  
end
