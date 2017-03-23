class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.integer :origin_id
      t.integer :work_id
      t.boolean :preferred, default: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
