module Refinery
  module PvDocuments
    class PvDocumentsController < ::ApplicationController

      layout "pv_documentos"

      before_action :find_all_pv_documents
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_document in the line below:
        present(@page)
      end

      def show
        @pv_document = PvDocument.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pv_document in the line below:
        present(@page)
      end

    protected

      def find_all_pv_documents
        @pv_documents = PvDocument.order('creation_date DESC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/empresa/informacion-financiera").first
      end

    end
  end
end
