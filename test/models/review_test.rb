require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:archer)
    @restaurant = restaurants(:casona)
    @review = @user.reviews.build(content: 'lorem ipsum', rating: 2, user_id: @user.id, restaurant_id: @restaurant.id)
  end

  test 'should be valid' do
    assert @review.valid?
  end

  test 'user_id should be present' do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test 'content should be present' do
    @review.content = ''
    assert_not @review.valid?
  end

  test 'content should be at most 1000 characters' do
    @review.content = 'a' * 1001
    assert_not @review.valid?
  end

  test 'order should be most recent first' do
    assert_equal Review.first, reviews(:most_recent)
  end

end
