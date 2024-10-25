# This migration comes from refinery_pv_faqs (originally 1)
class CreatePvFaqsPvFaqs < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_faqs do |t|
      t.string :title
      t.text :question
      t.text :answer
      t.boolean :status
      t.integer :refinery_pv_category_id
      t.integer :position

      t.timestamps
    end

    Refinery::PvFaqs::PvFaq.create_translation_table! :title => :string, :question => :text, :answer => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_faqs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_faqs/pv_faqs"})
    end

    drop_table :refinery_pv_faqs

    Refinery::PvFaqs::PvFaq.drop_translation_table!

  end

end
