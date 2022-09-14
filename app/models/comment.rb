class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: { maximum: 255, too_long: "Anda melebihi batas maksimal 255 karakter" }
end
