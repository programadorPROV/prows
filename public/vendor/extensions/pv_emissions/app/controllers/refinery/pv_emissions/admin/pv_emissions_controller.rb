module Refinery
  module PvEmissions
    module Admin
      class PvEmissionsController < ::Refinery::AdminController

        crudify :'refinery/pv_emissions/pv_emission'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_emission_params
          params.require(:pv_emission).permit(:title, :description, :photo_id, :refinery_pv_category_id)
        end
      end
    end
  end
end
