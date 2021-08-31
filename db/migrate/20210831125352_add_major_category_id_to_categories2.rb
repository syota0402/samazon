class AddMajorCategoryIdToCategories2 < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :major_category_id, :integer
  end
end
