class CreatePvBulletinsPvBulletins < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_bulletins do |t|
      t.string :title
      t.integer :thumbnail_id
      t.integer :bulletin_image_id
      t.text :content
      t.date :creation_date
      t.boolean :status
      t.string :associated_link
      t.integer :refinery_pv_category_id
      t.integer :position

      t.timestamps
    end

    Refinery::PvBulletins::PvBulletin.create_translation_table! :title => :string, :content => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_bulletins"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_bulletins/pv_bulletins"})
    end

    drop_table :refinery_pv_bulletins

    Refinery::PvBulletins::PvBulletin.drop_translation_table!

  end

end
