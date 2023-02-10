class AddCounterCacheToCategories < ActiveRecord::Migration[7.0]
  def change
     add_column :categories, :entries_count, :integer, default: 0
  end
end
