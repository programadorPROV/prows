module Refinery
  module PvDocuments
    module Admin
      class PvDocumentsController < ::Refinery::AdminController

        crudify :'refinery/pv_documents/pv_document'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_document_params
          params.require(:pv_document).permit(:title, :description, :status, :creation_date, :file_url_id, :refinery_pv_category_id)
        end
      end
    end
  end
end
