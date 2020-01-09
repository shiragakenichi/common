class Image < ApplicationRecord
  belongs_to :album, optional: true
  mount_uploader :image, ImageUploader
end
