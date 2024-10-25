module Refinery
  module PvServices
    module Admin
      class PvServicesController < ::Refinery::AdminController

        crudify :'refinery/pv_services/pv_service'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_service_params
          params.require(:pv_service).permit(:title, :description, :photo_id, :status, :refinery_pv_category_id)
        end
      end
    end
  end
end
