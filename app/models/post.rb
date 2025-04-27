class Post < ApplicationRecord

  belongs_to :car

  validates :title, presence: true
  validates :body, presence: true

end
