class Car < ApplicationRecord
  has_many :posts, dependent: :destroy

  belongs_to :user

  has_one_attached :car_image

  validates :manufacturer, presence: true
  validates :car_name, presence: true

end
