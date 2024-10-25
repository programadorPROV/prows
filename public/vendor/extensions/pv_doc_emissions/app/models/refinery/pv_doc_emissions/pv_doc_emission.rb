module Refinery
  module PvDocEmissions
    class PvDocEmission < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_doc_emissions'


      translates :title

      validates :title, :presence => true, :uniqueness => true

      belongs_to :document, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
