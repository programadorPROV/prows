module Refinery
  module PvEmissions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvEmissions

      engine_name :refinery_pv_emissions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_emissions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_emissions_admin_pv_emissions_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvEmissions)
      end
    end
  end
end
