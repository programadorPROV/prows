module Refinery
  module PvHomeMainSections
    module Admin
      class PvHomeMainSectionsController < ::Refinery::AdminController

        crudify :'refinery/pv_home_main_sections/pv_home_main_section'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_home_main_section_params
          params.require(:pv_home_main_section).permit(:title, :photo_id, :description)
        end
      end
    end
  end
end
