module Refinery
  module PvEmissions
    class PvEmissionsController < ::ApplicationController

      before_action :find_all_pv_emissions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_emission in the line below:
        present(@page)
      end

      def show
        @pv_emission = PvEmission.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_emission in the line below:
        present(@page)
      end

    protected

      def find_all_pv_emissions
        @pv_emissions = PvEmission.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_emissions").first
      end

    end
  end
end
