module Refinery
  module PvHomeMainSections
    class PvHomeMainSectionsController < ::ApplicationController

      before_action :find_all_pv_home_main_sections
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_home_main_section in the line below:
        present(@page)
      end

      def show
        @pv_home_main_section = PvHomeMainSection.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_home_main_section in the line below:
        present(@page)
      end

    protected

      def find_all_pv_home_main_sections
        @pv_home_main_sections = PvHomeMainSection.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_home_main_sections").first
      end

    end
  end
end
