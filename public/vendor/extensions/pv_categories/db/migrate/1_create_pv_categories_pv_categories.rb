class CreatePvCategoriesPvCategories < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_categories do |t|
      t.string :name
      t.text :description
      t.boolean :status
      t.string :type_name
      t.text :description_type
      t.integer :position

      t.timestamps
    end

    Refinery::PvCategories::PvCategory.create_translation_table! :name => :string, :description => :text, :type_name => :string, :description_type => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_categories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.where(:link_url => "/pv_categories/pv_categories").delete_all
    end

    drop_table :refinery_pv_categories

    Refinery::PvCategories::PvCategory.drop_translation_table!

  end

end
