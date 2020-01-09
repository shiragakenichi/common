class Interest < ApplicationRecord
  has_many :interest_users
  has_many :users, through: :interest_users
  mount_uploader :imagelist, ImageUploader


  def tagfllow!(user,other_interest)
    interest_users.create!(user_id:user.id,interest_id: other_interest.id)
  end

  def untagfllow!(user,other_interest)
    interest_users.find_by(user_id:user.id,interest_id: other_interest.id).destory
  end

  def self.tsearch(search)
    return Interest.all unless search
    Interest.where('tag LIKE(?)', "%#{search}%")
  end


end
