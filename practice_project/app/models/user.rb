class User < ApplicationRecord
    # Validations
    validates :username, presence: true, uniqueness: true

    # Associations
    has_many :artworks, foreign_key: 'artist_id', dependent: :destroy, inverse_of: :artist
    has_many :artwork_shares, foreign_key: :viewer_id, dependent: :destroy, inverse_of: :viewer
    has_many :shared_artworks, through: :artwork_shares, source: :artwork, dependent: :destroy, inverse_of: :shared_viewers
end
