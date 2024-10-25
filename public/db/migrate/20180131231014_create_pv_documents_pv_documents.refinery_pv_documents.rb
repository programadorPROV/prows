# This migration comes from refinery_pv_documents (originally 1)
class CreatePvDocumentsPvDocuments < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_documents do |t|
      t.string :title
      t.text :description
      t.boolean :status
      t.date :creation_date
      t.integer :file_url_id
      t.integer :refinery_pv_category_id
      t.integer :position

      t.timestamps
    end

    Refinery::PvDocuments::PvDocument.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_documents"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_documents/pv_documents"})
    end

    drop_table :refinery_pv_documents

    Refinery::PvDocuments::PvDocument.drop_translation_table!

  end

end
