class Friendship < ActiveRecord::Base
  belongs_to :following, class_name:  'User',
                         foreign_key: 'followee_id'
  validates :followee_id, presence: true

  belongs_to :follower, class_name:  'User',
                        foreign_key: 'follower_id'
  validates :follower_id, presence: true
end
