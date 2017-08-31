class Friendship < ActiveRecord::Base
  belongs_to :following, class_name:  'User',
                         foreign_key: 'followee_id'
  validates :followee_id, presence: true
end
