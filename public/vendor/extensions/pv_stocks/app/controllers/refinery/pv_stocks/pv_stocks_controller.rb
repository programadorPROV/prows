module Refinery
  module PvStocks
    class PvStocksController < ::ApplicationController

      before_action :find_all_pv_stocks
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_stock in the line below:
        present(@page)
      end

      def show
        @pv_stock = PvStock.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_stock in the line below:
        present(@page)
      end

    protected

      def find_all_pv_stocks
        @pv_stocks = PvStock.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_stocks").first
      end

    end
  end
end
