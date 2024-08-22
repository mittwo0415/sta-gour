class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  
  validates :content, presence: true
end
