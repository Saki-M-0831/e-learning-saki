class Activity < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :action, polymorphic: true
  default_scope { order(created_at: :desc) }
end
