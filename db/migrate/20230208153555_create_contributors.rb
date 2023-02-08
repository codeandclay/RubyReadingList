class CreateContributors < ActiveRecord::Migration[7.0]
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :email
      t.string :url
      t.boolean :give_credit

      t.timestamps
    end
  end
end
