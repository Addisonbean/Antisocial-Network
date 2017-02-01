require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = users(:valid_user)
	end

	test "valid user signup" do
		assert @user.valid?
	end

	test "signup with invalid email" do
		@user.email = "meh@"
		assert_not @user.valid?

		@user.email = "@meh"
		assert_not @user.valid?

		@user.email = "meh@mail"
		assert_not @user.valid?

		@user.email = "q" * 247 + "@gmail.com"
		assert_not @user.valid?
	end

	test "signup with invalid username" do
		@user.username = "q" * 21
		assert_not @user.valid?
	end

	test "signup with duplicate information" do
		user2 = @user.dup
		@user.save
		assert_not user2.valid?
	end

end
