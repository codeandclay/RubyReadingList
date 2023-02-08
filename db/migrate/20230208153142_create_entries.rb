class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.text :description, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.jsonb :metadata

      t.timestamps
    end
  end
end
