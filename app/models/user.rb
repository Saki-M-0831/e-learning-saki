class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :activities, dependent: :destroy
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

  def word_learned(categ_id)
    lesson_ids = lessons.pluck(:id)

    if !categ_id.nil?
      @lessons = Lesson.where(category_id: categ_id)
      word_filtered_ids = @lessons.pluck(:id)
      @answers = Answer.where(lesson_id: word_filtered_ids)
    else
      @answers = Answer.where(lesson_id: lesson_ids)
    end
  end

  def feed
    following_ids = followings.pluck(:id)
    following_ids << id
    @activities = Activity.where(user_id: following_ids)
  end
end
