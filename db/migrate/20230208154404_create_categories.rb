class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :plural_name, null: false, unique: true
      t.string :singular_name, null: false, unique: true

      t.timestamps
    end
  end
end
