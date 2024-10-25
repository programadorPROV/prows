module Refinery
  module PvFaqs
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvFaqs

      engine_name :refinery_pv_faqs

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_faqs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_faqs_admin_pv_faqs_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvFaqs)
      end
    end
  end
end
