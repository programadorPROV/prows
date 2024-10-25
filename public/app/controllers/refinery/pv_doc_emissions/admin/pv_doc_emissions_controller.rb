module Refinery
  module PvDocEmissions
    module Admin
      class PvDocEmissionsController < ::Refinery::AdminController

        crudify :'refinery/pv_doc_emissions/pv_doc_emission'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_doc_emission_params
          params.require(:pv_doc_emission).permit(:title, :document_id, :url_doc, :status, :refinery_pv_emission_id)
        end
      end
    end
  end
end
