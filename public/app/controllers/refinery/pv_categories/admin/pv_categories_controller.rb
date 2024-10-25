module Refinery
  module PvCategories
    module Admin
      class PvCategoriesController < ::Refinery::AdminController

        crudify :'refinery/pv_categories/pv_category',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_category_params
          params.require(:pv_category).permit(:name, :description, :status, :type_name, :description_type, :photo_id)
        end
      end
    end
  end
end
