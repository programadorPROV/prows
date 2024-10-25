module Refinery
  module PvServices
    class PvService < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_services'


      translates :title, :description

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
