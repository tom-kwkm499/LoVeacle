class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :cars, dependent: :destroy

  # プロフィール画像を保持
  has_one_attached :profile_image

  validates :name, presence: true

  # プロフィール画像表示
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'user_brank.jpg'
  end

end
