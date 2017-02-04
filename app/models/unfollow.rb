class Unfollow < ApplicationRecord
	belongs_to :unfollower, class_name: "User"
	belongs_to :unfollowed, class_name: "User"
end
