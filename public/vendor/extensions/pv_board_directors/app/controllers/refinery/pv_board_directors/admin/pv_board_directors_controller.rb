module Refinery
  module PvBoardDirectors
    module Admin
      class PvBoardDirectorsController < ::Refinery::AdminController

        crudify :'refinery/pv_board_directors/pv_board_director',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_board_director_params
          params.require(:pv_board_director).permit(:name, :last_name, :position, :description, :mail, :link, :photo_id, :status)
        end
      end
    end
  end
end
