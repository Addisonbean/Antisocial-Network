require 'test_helper'

class UnfollowTest < ActiveSupport::TestCase

	def setup
		@bobby_flay = users(:bobby_flay)
		@jonny = users(:jonny)
	end

	test "unfollowing" do
		assert @bobby_flay.following?(@jonny)
		assert_not @jonny.unfollowers.include?(@bobby_flay)

		@bobby_flay.unfollow(@jonny)

		assert_not @bobby_flay.following?(@jonny)
		assert @jonny.unfollowers.include?(@bobby_flay)
	end

end
