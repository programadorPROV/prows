module Refinery
  module PvFaqs
    class PvFaqsController < ::ApplicationController

      layout "pv_preguntas_frecuentres"

      before_action :find_all_pv_faqs
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_faq in the line below:
        present(@page)
      end

      def show
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_faq in the line below:
        present(@page)
      end

    protected

      def find_all_pv_faqs
        @pv_faqs = PvFaq.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/herramientas/preguntas-frecuentes").first
      end

    end
  end
end
