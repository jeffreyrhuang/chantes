require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase

  def setup
    @user = users(:archer)
    @restaurant = restaurants(:casona)
  end

  test 'logged in user should be able to access new review page' do
    sign_in @user
    get :new, restaurant_id: @restaurant.id
    assert_response :success
  end

end
