namespace :promoter do
  namespace :event_select do
    
    desc "Refresh the cached list of events."
    task :refresh => :environment do
      EventSelect.refresh
    end
    
  end
end