module Refinery
  module PvSliderImages
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvSliderImages

      engine_name :refinery_pv_slider_images

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_slider_images"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_slider_images_admin_pv_slider_images_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvSliderImages)
      end
    end
  end
end
