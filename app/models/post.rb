class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_associated :comments
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 255, too_long: "Anda melebihi batas maksimal 255 karakter" }
end
