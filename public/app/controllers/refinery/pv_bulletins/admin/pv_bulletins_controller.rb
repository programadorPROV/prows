module Refinery
  module PvBulletins
    module Admin
      class PvBulletinsController < ::Refinery::AdminController

        crudify :'refinery/pv_bulletins/pv_bulletin'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_bulletin_params
          params.require(:pv_bulletin).permit(:title, :thumbnail_id, :bulletin_image_id, :content, :creation_date, :status, :associated_link, :refinery_pv_category_id, :description)
        end
      end
    end
  end
end
