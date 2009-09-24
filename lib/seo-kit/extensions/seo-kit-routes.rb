if defined?(ActionController::Routing::RouteSet)
  class ActionController::Routing::RouteSet
    def load_routes_with_seo_kit!
      lib_path = File.dirname(__FILE__)
      seo_kit_routes = File.join(lib_path, *%w[.. .. .. config routes.rb])
      unless configuration_files.include?(seo_kit_routes)
        add_configuration_file(seo_kit_routes)
      end
      load_routes_without_seo_kit!
    end

    alias_method_chain :load_routes!, :seo_kit
  end
end
