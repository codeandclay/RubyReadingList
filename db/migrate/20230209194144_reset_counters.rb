class ResetCounters < ActiveRecord::Migration[7.0]
  def change
    CountResetter.run
  end
end
