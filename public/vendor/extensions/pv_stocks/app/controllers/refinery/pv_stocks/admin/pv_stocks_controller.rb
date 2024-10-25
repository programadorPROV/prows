module Refinery
  module PvStocks
    module Admin
      class PvStocksController < ::Refinery::AdminController

        crudify :'refinery/pv_stocks/pv_stock',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def pv_stock_params
          params.require(:pv_stock).permit(:name, :ticker, :market, :min_cor, :average_cor, :max_cor, :min_usd, :average_usd, :max_usd)
        end
      end
    end
  end
end
