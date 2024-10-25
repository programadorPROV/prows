class AddLinkToRefineryPvHomeMainSection < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_home_main_sections, :link, :string
  end
end
