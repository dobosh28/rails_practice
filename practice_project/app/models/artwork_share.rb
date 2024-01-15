class ArtworkShare < ApplicationRecord
  belongs_to :artwork, inverse_of: :artwork_shares
  belongs_to :viewer, class_name: 'User', inverse_of: :artwork_shares
end
