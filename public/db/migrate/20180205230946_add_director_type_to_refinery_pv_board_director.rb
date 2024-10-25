class AddDirectorTypeToRefineryPvBoardDirector < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_board_directors, :director_type, :string
  end
end
