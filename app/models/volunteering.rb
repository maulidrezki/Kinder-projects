class Volunteering < ApplicationRecord
  belongs_to :user
  belongs_to :project

  VOLUNTEER_STATUS = %w[pending confirmed rejected]
end
