module Refinery
  module PvEmissions
    class PvEmissionsController < ::ApplicationController

      layout "pv_emission"

      before_action :find_all_pv_emissions
      before_action :find_page

      def index
        if params[:category].present?
          @pv_emission = PvEmission.where(:refinery_pv_category_id => params[:category])
        end

        if params[:contenido].present?

        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_emission in the line below:
        present(@page)
      end

      def show
        @pv_emission = PvEmission.find(params[:id])
        @pv_emision_menu = PvEmission.where(:refinery_pv_category_id => @pv_emission.refinery_pv_category_id)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_emission in the line below:
        present(@page)
      end

    protected

      def find_all_pv_emissions
        @pv_emissions = PvEmission.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/emisiones").first
      end

    end
  end
end
