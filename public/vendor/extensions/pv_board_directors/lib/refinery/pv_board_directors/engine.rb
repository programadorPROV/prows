module Refinery
  module PvBoardDirectors
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvBoardDirectors

      engine_name :refinery_pv_board_directors

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_board_directors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_board_directors_admin_pv_board_directors_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvBoardDirectors)
      end
    end
  end
end
