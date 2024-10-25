module Refinery
  module PvStocks
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvStocks

      engine_name :refinery_pv_stocks

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_stocks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_stocks_admin_pv_stocks_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvStocks)
      end
    end
  end
end
