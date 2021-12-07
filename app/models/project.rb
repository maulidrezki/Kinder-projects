class Project < ApplicationRecord
  belongs_to :user

  has_many :volunteerings
  has_many :volunteers, through: :volunteerings, source: "user"
  has_many :messages
  has_many_attached :photos
  
end
