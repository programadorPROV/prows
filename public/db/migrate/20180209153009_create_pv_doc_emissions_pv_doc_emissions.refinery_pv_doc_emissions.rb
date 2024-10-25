# This migration comes from refinery_pv_doc_emissions (originally 1)
class CreatePvDocEmissionsPvDocEmissions < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_doc_emissions do |t|
      t.string :title
      t.integer :document_id
      t.string :url_doc
      t.boolean :status
      t.integer :refinery_pv_emission_id
      t.integer :position

      t.timestamps
    end

    Refinery::PvDocEmissions::PvDocEmission.create_translation_table! :title => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_doc_emissions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_doc_emissions/pv_doc_emissions"})
    end

    drop_table :refinery_pv_doc_emissions

    Refinery::PvDocEmissions::PvDocEmission.drop_translation_table!

  end

end
