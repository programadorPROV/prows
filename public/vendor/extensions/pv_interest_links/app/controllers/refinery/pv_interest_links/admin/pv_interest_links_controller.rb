module Refinery
  module PvInterestLinks
    module Admin
      class PvInterestLinksController < ::Refinery::AdminController

        crudify :'refinery/pv_interest_links/pv_interest_link'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_interest_link_params
          params.require(:pv_interest_link).permit(:title, :link, :status)
        end
      end
    end
  end
end
