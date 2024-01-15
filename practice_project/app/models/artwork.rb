class Artwork < ApplicationRecord
    # Validations
    validates :title, presence: true, uniqueness: { scope: :artist_id, message: "Artist cannot have two artworks with the same title" }
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, presence: true  # Updated field name
  
    # Associations
    belongs_to :artist, class_name: 'User', foreign_key: 'artist_id', inverse_of: :artworks
    has_many :artwork_shares, dependent: :destroy, inverse_of: :artwork
    has_many :shared_viewers, through: :artwork_shares, source: :viewer, inverse_of: :shared_artworks
    has_many :comments, dependent: :destroy, inverse_of: :artwork
end
  