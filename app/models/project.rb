class Project < ApplicationRecord
  belongs_to :user

  has_many :volunteerings
  has_many :volunteers, through: :volunteerings, source: "user"
  has_many :messages
  has_one_attached :photos

  PROJECT_STATUS = %w[open closed cancelled]

  validates :display_name, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :photos, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?, :start_date_after_today?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def start_date_after_today?
    if start_date <= Date.today
      errors.add :start_date, "must be after today"
    end
  end



   <%= project.input :display_name %>
    <%= project.input :contact %>
    <%= project.input :title %>
    <%= project.input :description%>
    <%= project.input :location %>
    <%= project.input :capacity %>
    <%= project.input :start_date, html5: true %>
    <%= project.input :end_date, html5: true %>
    <%= project.input :start_time %>
    <%= project.input :end_time %>
    <%= project.input :instagram_link %>
    <%= project.input :facebook_link %>
    <%= project.input :website_link %>
    <%= project.input :linkedin_link %>
    <%= project.input :status, collection: Project::PROJECT_STATUS %>
    <%= project.input :photos, input_html: { max: '1' } %>


      validates :status, inclusion: { in: STATUS }
  # validates :start_date, date: { after_or_equal_to: Date.today }
  validates :end_date, presence: true

  validate :end_date_after_start_date?, :start_date_after_today? #, :owner_booking?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def start_date_after_today?
    if start_date <= Date.today
      errors.add :start_date, "must be after today"
    end
  end

end
