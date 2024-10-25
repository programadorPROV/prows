module Refinery
  module PvServices
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvServices

      engine_name :refinery_pv_services

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_services"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_services_admin_pv_services_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvServices)
      end
    end
  end
end
