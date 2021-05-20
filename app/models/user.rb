class User < ApplicationRecord
  has_many :lessons
  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: { maximum: 50 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: {maximum: 255 },
                    format: { with: EMAIL_REGEX },  
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def follow(other_user)
    Relationship.create(
      follower_id: id,
      followed_id: other_user.id
    )
  end

  def active_relationships
    Relationship.where(follower_id: id)
  end

  def passive_relationships
    Relationship.where(followed_id: id)
  end

  def relationship(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def followers
    ids = passive_relationships.pluck(:follower_id)
    User.where(id: ids)
  end

  def followings
    ids = active_relationships.pluck(:followed_id)
    User.where(id: ids)
  end 
end
