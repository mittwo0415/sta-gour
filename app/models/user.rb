class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
         #:recoverable, 
         
  validates :name, presence: true
         
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
