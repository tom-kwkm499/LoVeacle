class Car < ApplicationRecord
  has_many :posts, dependent: :destroy

  belongs_to :user

  validates :manufacturer, presence: true
  validates :car_name, presence: true

end
