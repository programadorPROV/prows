module Refinery
  module PvInterestLinks
    class PvInterestLinksController < ::ApplicationController

      before_action :find_all_pv_interest_links
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_interest_link in the line below:
        present(@page)
      end

      def show
        @pv_interest_link = PvInterestLink.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_interest_link in the line below:
        present(@page)
      end

    protected

      def find_all_pv_interest_links
        @pv_interest_links = PvInterestLink.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_interest_links").first
      end

    end
  end
end
