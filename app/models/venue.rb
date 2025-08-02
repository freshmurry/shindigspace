class Venue < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}
  
  belongs_to :user, optional: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :reservations
  
  has_many :guest_reviews
  has_many :calendars
    
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def cover_photo(size)
    if self.photos.length > 0
      url = self.photos[0].image.url(size)
      # Decode URL encoding and ensure proper format
      decoded_url = CGI.unescape(url)
      if decoded_url.start_with?('//')
        "https:#{decoded_url}"
      elsif decoded_url.start_with?('http')
        decoded_url
      else
        decoded_url
      end
    end      
  end
  
  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end
end
