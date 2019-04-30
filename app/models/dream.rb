class Dream < ApplicationRecord
  scope :share_dreams, -> { where(release: true) }
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  has_many :relationships, dependent: :destroy
  has_many :dreamfollowers, through: :relationships, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy
end
