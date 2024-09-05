class AddFieldsToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :bathrooms, :integer
    add_column :venues, :parking, :string
  end
end
