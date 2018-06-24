class ChangeSequenceLengthLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :fibs, :squares_sum, :integer, limit: 21
  end
end
