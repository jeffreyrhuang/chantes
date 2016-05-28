require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  
  def setup
    @restaurant = Restaurant.new(name: 'GoodEats', location: 'Costa Rica', cuisine: 'Ticostyle')
    @user = users(:archer)
  end

  test 'associated reviews should be destroyed' do
    @restaurant.save
    @restaurant.reviews.create!(content: 'lorem ipsum', user: @user)
    assert_difference 'Review.count', -1 do
      @restaurant.destroy
    end
  end

end
