class ActionController::Routing::RouteSet
  def load_routes_with_promoter!
    lib_path = File.dirname(__FILE__)
    promoter_routes = File.join(lib_path, *%w[.. .. .. config promoter_routes.rb])
    unless configuration_files.include?(promoter_routes)
      add_configuration_file(promoter_routes)
    end
    load_routes_without_promoter!
  end

  alias_method_chain :load_routes!, :promoter
end