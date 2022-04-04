class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20}


  validates :introduction, length: { maximum: 50 }


  has_many :books, dependent: :destroy

  has_many :book_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
