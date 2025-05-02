class Car < ApplicationRecord
  has_many :posts, dependent: :destroy

  belongs_to :user

  has_one_attached :car_image

  validates :manufacturer, presence: true
  validates :car_name, presence: true


    # 車両画像表示
    def get_car_image
      (car_image.attached?) ? car_image : 'car_brank.jpg'
    end
end
