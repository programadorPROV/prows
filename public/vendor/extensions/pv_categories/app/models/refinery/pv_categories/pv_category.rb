module Refinery
  module PvCategories
    class PvCategory < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_categories'


      translates :name, :description, :type_name, :description_type

      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
