require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'unique email' do
  	user = User.new(
  		email: 'email@example.com',
  		password: 'password'
		)
		assert user.valid?
		user.save
		user2 = User.new(
			email: 'email@example.com',
			password: 'password'
		)
		assert user2.invalid?
  end
end
