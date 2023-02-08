class PointContributorAtEntry < ActiveRecord::Migration[7.0]
  def change
    add_reference :contributors, :entry, foreign_key: true
  end
end
