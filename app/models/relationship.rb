class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name
  validates :follower_id, presence: true # blank follower_id is not allowed
  validates :followed_id, presence: true # blank followed_id is not allowed
end

