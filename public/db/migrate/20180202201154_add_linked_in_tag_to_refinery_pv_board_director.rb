class AddLinkedInTagToRefineryPvBoardDirector < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_board_directors, :linked_in_tag, :string
  end
end
