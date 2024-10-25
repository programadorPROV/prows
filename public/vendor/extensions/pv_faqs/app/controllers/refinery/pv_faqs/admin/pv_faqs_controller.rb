module Refinery
  module PvFaqs
    module Admin
      class PvFaqsController < ::Refinery::AdminController

        crudify :'refinery/pv_faqs/pv_faq'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_faq_params
          params.require(:pv_faq).permit(:title, :question, :answer, :status, :refinery_pv_category_id)
        end
      end
    end
  end
end
