class Project < ApplicationRecord
  # acts_as_favoritable

  belongs_to :user

  has_many :volunteerings
  has_many :volunteers, through: :volunteerings, source: "user"
  has_many :messages
  has_one_attached :photos

  PROJECT_STATUS = %w[open closed cancelled]

  validates :title, :location, :photos, :start_date, :description, presence: true
  validates :description, length: { minimum: 65 }
  validates :status, presence: true, inclusion: { in: PROJECT_STATUS }
  validate :end_date_after_start_date?, :start_date_after_today?

  def end_date_after_start_date?
    if end_date && end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def start_date_after_today?
    if start_date && start_date < Date.today
      errors.add :start_date, "must be after today"
    end
  end

end
