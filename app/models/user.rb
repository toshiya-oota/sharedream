class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  def user_sharedreams
    self.dreams.where(release: true)
  end
  
  has_many :dreams, dependent: :destroy
  has_many :relationships
  has_many :followdreams, through: :relationships, source: :dream
  
  def dreamfollowers
    User.where(id: Relationship.where(dream_id: self.user_sharedreams.pluck(:id)).pluck(:user_id).uniq)
  end

  def follow(other_dream)
    unless self == other_dream
      self.relationships.find_or_create_by(dream_id: other_dream.id)
    end
  end

  def unfollow(other_dream)
    relationship = self.relationships.find_by(dream_id: other_dream.id)
    relationship.destroy if relationship
  end

  def following?(other_dream)
    self.followdreams.include?(other_dream)
  end
end
