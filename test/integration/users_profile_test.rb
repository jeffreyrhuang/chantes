require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:archer)
    sign_in users(:archer)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    # assert_match @user.reviews.count.to_s, response.body
  end

end
