class AddPhotoToRefineryPvCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_categories, :photo_id, :integer
  end
end
