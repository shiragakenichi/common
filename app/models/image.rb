class Image < ApplicationRecord
  belongs_to :album, optional: true
  mount_uploaders :image, ImageUploader
end
