class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.integer :accommodate #10-50, 50-100, 100-150, 150-200, 200-250, 250-300, 300+
      t.string :listing_name
      t.text :description
      t.string :address
      t.boolean :is_youpickup
      t.boolean :is_youdropoff
      t.boolean :is_wedropoff
      t.boolean :is_wepickup
      t.integer :instant, default: 1
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end