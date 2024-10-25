module Refinery
  module PvSliderImages
    module Admin
      class PvSliderImagesController < ::Refinery::AdminController

        crudify :'refinery/pv_slider_images/pv_slider_image'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_slider_image_params
          params.require(:pv_slider_image).permit(:title, :description, :photo_id, :satus)
        end
      end
    end
  end
end
