class Category < ApplicationRecord
  validates :title, presence: true
  
  validates :description, presence: true, length: {maximum: 50}
end
