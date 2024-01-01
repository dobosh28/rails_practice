class User < ApplicationRecord
    # Validations
    validates :username, presence: true, uniqueness: true

    # Associations
    has_many :artworks, foreign_key: 'artist_id', dependent: :destroy,
end
