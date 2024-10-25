class AddRefineryPvCategoryToRefineryPvInterestLink < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pv_interest_links, :refinery_pv_category_id, :integer
  end
end
