class CreatePvBoardDirectorsPvBoardDirectors < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_pv_board_directors do |t|
      t.string :name
      t.string :last_name
      t.string :position
      t.text :description
      t.string :mail
      t.string :link
      t.integer :photo_id
      t.boolean :status
      t.integer :position

      t.timestamps
    end

    Refinery::PvBoardDirectors::PvBoardDirector.create_translation_table! :position => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pv_board_directors"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pv_board_directors/pv_board_directors"})
    end

    drop_table :refinery_pv_board_directors

    Refinery::PvBoardDirectors::PvBoardDirector.drop_translation_table!

  end

end
