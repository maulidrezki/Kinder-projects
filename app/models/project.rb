class Project < ApplicationRecord
  belongs_to :user

  has_many :volunteerings
  has_many :volunteers, through: :volunteerings, source: "user"
  has_many :messages
  has_one_attached :photos

  PROJECT_STATUS = %w[open closed cancelled]

end
