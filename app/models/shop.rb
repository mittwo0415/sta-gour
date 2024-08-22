class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         #:recoverable, 
         
  has_many :menus
  has_many :reviews
  belongs_to :ball_park
end
