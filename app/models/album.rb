class Album < ApplicationRecord
  belongs_to :group
  has_many :images,dependent: :destroy
  accepts_nested_attributes_for :images
end
