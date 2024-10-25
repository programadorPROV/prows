class AddPreviewToRefineryPvEmission < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_emissions, :preview, :text
  end
end
