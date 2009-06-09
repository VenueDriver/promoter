class PromoterFeaturesGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory File.join("features", "step_definitions")
      m.directory File.join("features", "support")
      
      ["features/step_definitions/promoter_steps.rb",
       "features/support/paths.rb",
       "features/reservations.feature",
       "features/guestlists.feature",
       "features/contacts.feature"].each do |file|
        m.file file, file
       end
    end
  end
  
end