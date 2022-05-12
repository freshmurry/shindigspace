class RemoveVenuesFkFromPhotos < ActiveRecord::Migration[5.0]
  def change
    if foreign_key_exists?(:photos, :venues)
      remove_foreign_key :photos, :venues
    end
  end
end