class AddDescriptionToRefineryPvBulletin < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_bulletins, :description, :text
  end
end
