module Refinery
  module PvCategories
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvCategories

      engine_name :refinery_pv_categories

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_categories_admin_pv_categories_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvCategories)
      end
    end
  end
end
