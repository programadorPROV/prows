# This migration comes from refinery_pv_stocks (originally 1)
class CreatePvStocksPvStocks < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_stocks do |t|
      t.string :name
      t.string :ticker
      t.string :market
      t.decimal :min_cor
      t.decimal :average_cor
      t.decimal :max_cor
      t.decimal :min_usd
      t.decimal :average_usd
      t.decimal :max_usd
      t.integer :position

      t.timestamps
    end

    Refinery::PvStocks::PvStock.create_translation_table! :name => :string, :ticker => :string, :market => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_stocks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_stocks/pv_stocks"})
    end

    drop_table :refinery_pv_stocks

    Refinery::PvStocks::PvStock.drop_translation_table!

  end

end
