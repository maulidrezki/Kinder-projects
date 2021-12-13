class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # acts_as_favoritable

  has_many :projects
  has_many :volunteerings
  has_many :messages

  validates :first_name, :last_name, :display_name, presence: true, length: { in: 2..26 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def volunteer_projects
    projects = Project.includes(:volunteerings).where(volunteerings: { user_id: id })
  end

end
