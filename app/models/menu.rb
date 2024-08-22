class Menu < ApplicationRecord
  belongs_to :shop
  has_one_attached :image
  
  validates :name, presence: true
  enum category: { food: 0, drink: 1, beer: 2 }
  
  has_many :users
  has_many :comments, dependent: :destroy
end
