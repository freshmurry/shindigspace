class RemoveVenuesFkFromPhotos < ActiveRecord::Migration[5.0]
  def change
    if foreign_key_exists?(:photos, :venues)
      remove_foreign_key :photos, :venues
      
      change_column :photos, :venue_id, :integer, null: true
    end
  end
end