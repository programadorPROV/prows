module Refinery
  module PvHomeMainSections
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvHomeMainSections

      engine_name :refinery_pv_home_main_sections

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_home_main_sections"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_home_main_sections_admin_pv_home_main_sections_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvHomeMainSections)
      end
    end
  end
end
