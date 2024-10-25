# This migration comes from refinery_pv_slider_images (originally 1)
class CreatePvSliderImagesPvSliderImages < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_slider_images do |t|
      t.string :title
      t.text :description
      t.integer :photo_id
      t.boolean :satus
      t.integer :position

      t.timestamps
    end

    Refinery::PvSliderImages::PvSliderImage.create_translation_table! :title => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_slider_images"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_slider_images/pv_slider_images"})
    end

    drop_table :refinery_pv_slider_images

    Refinery::PvSliderImages::PvSliderImage.drop_translation_table!

  end

end
