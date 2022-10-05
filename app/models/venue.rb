class Venue < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}
  
  belongs_to :user, required: false
  has_many :photos, dependent: :delete_all
  has_many :reservations
  
  has_many :guest_reviews
  has_many :calendars
    
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "https://images.unsplash.com/photo-1531265726475-52ad60219627?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1191&q=80"
    end
  end
  
  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
