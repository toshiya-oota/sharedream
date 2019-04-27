class Dream < ApplicationRecord
  scope :share_dreams, -> { where(release: true) }
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  has_many :sharedreams
  has_many :relationships
  has_many :dreamfollowers, through: :relationships, source: :user
end
