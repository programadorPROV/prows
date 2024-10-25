module Refinery
  module PvStocks
    class PvStock < Refinery::Core::BaseModel
      self.table_name = 'refinery_pv_stocks'


      translates :name, :ticker, :market

      validates :name, :presence => true, :uniqueness => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
