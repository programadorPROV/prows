module Refinery
  module PvDocuments
    class PvDocument < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_documents'


      translates :title, :description

      validates :title, :presence => true, :uniqueness => true

      belongs_to :file_url, :class_name => '::Refinery::Resource'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
