module Refinery
  module PvDocuments
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PvDocuments

      engine_name :refinery_pv_documents

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pv_documents"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pv_documents_admin_pv_documents_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PvDocuments)
      end
    end
  end
end
