class Artwork < ApplicationRecord
    # Validations

    validates :title, presence: true, uniqueness: { scope: :artist_id, message: "Artist cannot have two artworks with the same title" }
    validates :image_url, presence: true, uniqueness: true
    validates :user_id, presence: true

    # Associations
    belongs_to :artist, class_name: 'User', foreign_key: "artist_id"
    has_many :artwork_shares, dependent: :destroy
    has_many :shared_viewers, through: :artwork_shares, source: :viewer

end
