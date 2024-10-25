module Refinery
  module PvBulletins
    class PvBulletinsController < ::ApplicationController

      before_action :find_all_pv_bulletins
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_bulletin in the line below:
        present(@page)
      end

      def show
        @pv_bulletin = PvBulletin.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_bulletin in the line below:
        present(@page)
      end

    protected

      def find_all_pv_bulletins
        @pv_bulletins = PvBulletin.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_bulletins").first
      end

    end
  end
end
