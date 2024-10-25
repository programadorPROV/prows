# This migration comes from refinery_pv_interest_links (originally 1)
class CreatePvInterestLinksPvInterestLinks < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_interest_links do |t|
      t.string :title
      t.string :link
      t.boolean :status
      t.integer :position

      t.timestamps
    end

    Refinery::PvInterestLinks::PvInterestLink.create_translation_table! :title => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_interest_links"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_interest_links/pv_interest_links"})
    end

    drop_table :refinery_pv_interest_links

    Refinery::PvInterestLinks::PvInterestLink.drop_translation_table!

  end

end
