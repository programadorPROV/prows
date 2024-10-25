# This migration comes from refinery_pv_home_main_sections (originally 1)
class CreatePvHomeMainSectionsPvHomeMainSections < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_home_main_sections do |t|
      t.string :title
      t.integer :photo_id
      t.text :description
      t.integer :position

      t.timestamps
    end

    Refinery::PvHomeMainSections::PvHomeMainSection.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_home_main_sections"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_home_main_sections/pv_home_main_sections"})
    end

    drop_table :refinery_pv_home_main_sections

    Refinery::PvHomeMainSections::PvHomeMainSection.drop_translation_table!

  end

end
