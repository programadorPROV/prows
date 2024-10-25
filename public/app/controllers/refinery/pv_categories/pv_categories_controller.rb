module Refinery
  module PvCategories
    class PvCategoriesController < ::ApplicationController

      layout "pv_categoria"

      before_action :find_all_pv_categories
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_category in the line below:
        present(@page)
        #redirect_to refinery_path
      end

      def show
        @pv_category = PvCategory.find(params[:id])
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_category in the line below:
        present(@page)
        #redirect_to refinery_path
      end

      def method_name
        
      end

    protected

      def resolve_layout
        case action_name.to_sym
        when :index
          "pv_categoria"
        when :show
          "pv_categoria"
        else
          "pv_categoria"
        end
      end

      def find_all_pv_categories
        @pv_categories = PvCategory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/categoria").first
      end

    end
  end
end
