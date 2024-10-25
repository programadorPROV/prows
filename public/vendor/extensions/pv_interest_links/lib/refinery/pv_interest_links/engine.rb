module Refinery
  module PvInterestLinks
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvInterestLinks

      engine_name :refinery_pv_interest_links

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_interest_links"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_interest_links_admin_pv_interest_links_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvInterestLinks)
      end
    end
  end
end
