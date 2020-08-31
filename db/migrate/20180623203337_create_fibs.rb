class CreateFibs < ActiveRecord::Migration[5.2]
  def change
    create_table :fibs do |t|
      t.integer :sequence_length
      t.integer :squares_sum
      t.text :sequence

      t.timestamps
    end
  end
end
