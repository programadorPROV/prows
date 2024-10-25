module Refinery
  module PvBulletins
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvBulletins

      engine_name :refinery_pv_bulletins

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_bulletins"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_bulletins_admin_pv_bulletins_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvBulletins)
      end
    end
  end
end
