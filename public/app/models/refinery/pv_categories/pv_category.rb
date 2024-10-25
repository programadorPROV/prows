module Refinery
  module PvCategories
    class PvCategory < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_categories'


      translates :name, :description, :type_name, :description_type

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
      def self.type_map
        [
          ["Documentos Financieros", :doc_fin], 
          ["Preguntas Frecuentes", :faq], 
          ["Boletin", :news],
          ["Enlaces De Interes", :link],
          ["Emisiones", :emision],
          ["Servicios", :servicios]
        ]
      end
    end
  end
end
