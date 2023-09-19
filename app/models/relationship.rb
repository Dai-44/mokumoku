class Relationship < ApplicationRecord
  belogs_to :follower, class_name: 'User'
  belogs_to :followed, class_name: 'User'

  validates :follower_id, uniqueness: { scope: :followed_id }
end
