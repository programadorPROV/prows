module Refinery
  module PvDocEmissions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvDocEmissions

      engine_name :refinery_pv_doc_emissions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_doc_emissions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_doc_emissions_admin_pv_doc_emissions_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvDocEmissions)
      end
    end
  end
end
