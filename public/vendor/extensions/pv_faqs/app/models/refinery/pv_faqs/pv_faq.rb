module Refinery
  module PvFaqs
    class PvFaq < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_faqs'


      translates :title, :question, :answer

      validates :title, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
