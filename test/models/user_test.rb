require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(email: 'user@example.com', password: 'foobar')
    @restaurant = restaurants(:casona)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = '    '
    assert_not @user.valid?
  end

end
