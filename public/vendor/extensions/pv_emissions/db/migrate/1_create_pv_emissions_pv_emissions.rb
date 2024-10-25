class CreatePvEmissionsPvEmissions < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_emissions do |t|
      t.string :title
      t.text :description
      t.integer :photo_id
      t.integer :refinery_pv_category_id
      t.integer :position

      t.timestamps
    end

    Refinery::PvEmissions::PvEmission.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_emissions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_emissions/pv_emissions"})
    end

    drop_table :refinery_pv_emissions

    Refinery::PvEmissions::PvEmission.drop_translation_table!

  end

end
