class Feedback < ApplicationRecord
  belongs_to :volunteering

  validates :content, presence: true
end
