module Refinery
  module PvCategories
    class PvCategoriesController < ::ApplicationController

      before_action :find_all_pv_categories
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_category in the line below:
        present(@page)
      end

      def show
        @pv_category = PvCategory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_category in the line below:
        present(@page)
      end

    protected

      def find_all_pv_categories
        @pv_categories = PvCategory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_categories").first
      end

    end
  end
end
