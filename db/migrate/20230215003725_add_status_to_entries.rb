class AddStatusToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :state, :string, null: false, default: 'unpublished'
  end
end
