class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5}
  validates :body, presence: true
  validates :post_photo, presence: true
  mount_uploader :post_photo, ProfilePhotoUploader
end
