class CreateTrainLines < ActiveRecord::Migration[5.0]
  def change
    create_table :train_lines do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
