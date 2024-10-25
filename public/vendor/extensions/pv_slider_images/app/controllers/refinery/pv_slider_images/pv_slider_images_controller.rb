module Refinery
  module PvSliderImages
    class PvSliderImagesController < ::ApplicationController

      before_action :find_all_pv_slider_images
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_slider_image in the line below:
        present(@page)
      end

      def show
        @pv_slider_image = PvSliderImage.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_slider_image in the line below:
        present(@page)
      end

    protected

      def find_all_pv_slider_images
        @pv_slider_images = PvSliderImage.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pv_slider_images").first
      end

    end
  end
end
