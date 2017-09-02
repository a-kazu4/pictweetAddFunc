class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_many :tweets

  has_many :comments

  has_many :following_friendships, class_name:  'Friendship',
                                   foreign_key: 'follower_id',
                                   dependent: :destroy
  has_many :followings, through: :following_friendships

  has_many :follower_friendships, class_name:  'Friendship',
                                  foreign_key: 'followee_id',
                                  dependent: :destroy
  has_many :followers, through: :follower_friendships

  def following?(other_user)
    following_friendships.find_by(followee_id: other_user.id)
  end

  def follow!(other_user)
    following_friendships.create!(followee_id: other_user.id)
  end

  def unfollow!(other_user)
    following_friendships.find_by(followee_id: other_user.id).destroy
  end

end
