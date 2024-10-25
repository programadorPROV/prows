class CreatePvServicesPvServices < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_services do |t|
      t.string :title
      t.text :description
      t.integer :photo_id
      t.boolean :status
      t.integer :refinery_pv_category_id
      t.integer :position

      t.timestamps
    end

    Refinery::PvServices::PvService.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_services"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_services/pv_services"})
    end

    drop_table :refinery_pv_services

    Refinery::PvServices::PvService.drop_translation_table!

  end

end
