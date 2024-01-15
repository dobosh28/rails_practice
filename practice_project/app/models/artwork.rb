class Artwork < ApplicationRecord
    # Validations

    validates :title, presence: true, uniqueness: { scope: :artist_id, message: "Artist cannot have two artworks with the same title" }
    validates :image_url, presence: true, uniqueness: true
    validates :user_id, presence: true

    # Associations
    belongs_to :artist, class_name: 'User', foreign_key: 'artist_id', inverse_of: :artworks
    has_many :artwork_shares, dependent: :destroy, inverse_of: :artwork
    has_many :shared_viewers, through: :artwork_shares, source: :viewer, dependent: :destroy, inverse_of: :shared_artworks

end
