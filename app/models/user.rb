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

end
