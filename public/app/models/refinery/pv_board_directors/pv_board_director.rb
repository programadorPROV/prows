module Refinery
  module PvBoardDirectors
    class PvBoardDirector < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_board_directors'


      translates :position, :description

      validates :name, :presence => true#, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]
      def self.type_map
        [
          ["Principales Ejecutivos", :prin_eje], 
          ["Junta Directiva", :jun_dir]
        ]
      end
    end
  end
end
