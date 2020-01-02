class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook google_oauth2 line]
         mount_uploader :image, ImageUploader
  has_many :group_users,dependent: :destroy
  has_many :messages
  has_many :groups, through: :group_users
  has_many :sns_credentials, dependent: :destroy
  has_one  :profile,dependent: :destroy

  
  
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships, source: :follower
  
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end


  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def ungroup!(user,other_group)
    group_users.find_by(user_id:user.id,group_id: other_group.id).destroy
  end

  def matchers
    follower_ids = following_relationships.pluck(:follower_id)
    following_relationships.eager_load(:following)
    .select{|r|follower_ids.include? r.following_id}
    .map{|r|r.following}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    
    if snscredential.present?
      user = User.where(email: auth.info.email).first

     
      unless user.present?
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
      end
      sns = snscredential
      
      { user: user, sns: sns}


    else
      user = User.where(email: auth.info.email).first



      if user.present?
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

        { user: user, sns: sns}

      else
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )

        { user: user, sns: sns}
      end
    end
  end
end
