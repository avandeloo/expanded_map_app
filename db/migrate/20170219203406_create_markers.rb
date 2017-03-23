class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.decimal :latitude, precision: 11, scale: 7
      t.decimal :longitude, precision: 11, scale: 7
      t.string :nickname
      t.string :address_line1
      t.string :address_line2
      t.integer :marker_role, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
