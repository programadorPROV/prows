module Refinery
  module PvBoardDirectors
    class PvBoardDirectorsController < ::ApplicationController
      
      layout "pv_junta_directiva"

      before_action :find_all_pv_board_directors
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_board_director in the line below:
        redirect_to refinery_path
        #present(@page)
      end

      def show
        redirect_to refinery_path
        #@pv_board_director = PvBoardDirector.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_board_director in the line below:
        #present(@page)
      end

    protected

      def find_all_pv_board_directors
        @pv_board_directors = PvBoardDirector.order('position ASC')
      end
      
      def find_page
        @page = ::Refinery::Page.where(:link_url => "/junta_directiva").first
      end

    end
  end
end
