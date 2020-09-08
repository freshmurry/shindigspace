class AddBarToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :is_bar, :boolean
  end
end
