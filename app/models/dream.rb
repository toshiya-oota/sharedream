class Dream < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  has_many :sharedreams
  has_many :relationships
  has_many :dreamfollowers, through: :sharedreams, source: :user
end
