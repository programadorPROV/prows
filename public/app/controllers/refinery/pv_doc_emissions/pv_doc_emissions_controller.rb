module Refinery
  module PvDocEmissions
    class PvDocEmissionsController < ::ApplicationController

      layout "pv_doc_emission"

      before_action :find_all_pv_doc_emissions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_doc_emission in the line below:
        present(@page)
      end

      def show
        @pv_doc_emission = PvDocEmission.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_doc_emission in the line below:
        present(@page)
      end

    protected

      def find_all_pv_doc_emissions
        @pv_doc_emissions = PvDocEmission.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_doc_emissions").first
      end

    end
  end
end
