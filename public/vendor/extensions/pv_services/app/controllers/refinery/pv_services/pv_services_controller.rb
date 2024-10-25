module Refinery
  module PvServices
    class PvServicesController < ::ApplicationController

      before_action :find_all_pv_services
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_service in the line below:
        present(@page)
      end

      def show
        @pv_service = PvService.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_service in the line below:
        present(@page)
      end

    protected

      def find_all_pv_services
        @pv_services = PvService.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_services").first
      end

    end
  end
end
