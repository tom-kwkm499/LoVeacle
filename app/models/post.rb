class Post < ApplicationRecord

  belongs_to :car

  has_one_attached :post_image

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }

end
