module Refinery
  module PvBulletins
    class PvBulletinsController < ::ApplicationController

      layout "pv_boletin"

      before_action :find_all_pv_bulletins
      before_action :find_page

      def index
        if params[:category].present?
          @pv_bulletin = PvBulletin.where(:refinery_pv_category_id => params[:category])
          category = Refinery::PvCategories::PvCategory.where(id: params[:category]).first
          @image = category.photo.url if category.present?
          @name = category.name
        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_bulletin in the line below:
        present(@page)
      end

      def show
        @pv_bulletin = PvBulletin.find(params[:id])
        @pv_bulletin_menu = PvBulletin.where(:refinery_pv_category_id => @pv_bulletin.refinery_pv_category_id)
        @pv_category = Refinery::PvCategories::PvCategory.find(@pv_bulletin.refinery_pv_category_id)
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_bulletin in the line below:
        present(@page)
      end

    protected

      def find_all_pv_bulletins
        @pv_bulletins = PvBulletin.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/herramientas/noticias-bursatiles").first
      end

    end
  end
end
