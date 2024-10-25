module Refinery
  module PvBulletins
    class PvBulletin < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_bulletins'


      translates :title, :content

      validates :title, :presence => true, :uniqueness => true

      belongs_to :thumbnail, :class_name => '::Refinery::Image'

      belongs_to :bulletin_image, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
