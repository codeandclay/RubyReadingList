class CreateAuthorships < ActiveRecord::Migration[7.0]
  def change
    create_table :authorships do |t|
      t.references :author, foreign_key: true
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
