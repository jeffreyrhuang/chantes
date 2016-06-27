require 'rails_helper'

describe Review, type: :model do

  it 'validates rating range' do
    r = build(:review, rating: 0)
    r.save
    expect(r.errors[:rating].count).to eq 1
    r = build(:review, rating: 6)
    r.save
    expect(r.errors[:rating].count).to eq 1
    r = build(:review, rating: 5)
    r.save
    expect(r.errors[:rating].count).to eq 0
  end

  it 'is invalid without a user_id' do
    review = build(:review, user_id: nil)
    review.valid?
    expect(review.errors[:user_id].count).to eq 1
  end

  it 'is invalid without a restaurant_id' do
    review = build(:review, restaurant_id: nil)
    review.valid?
    expect(review.errors[:restaurant_id].count).to eq 1
  end

  it 'is invalid without content' do
    review = build(:review, content: nil)
    review.valid?
    expect(review.errors[:content].count).to eq 1
  end

  it 'is invalid without a rating' do
    review = build(:review, rating: nil)
    review.valid?
    expect(review.errors[:rating]).to include("can't be blank")
  end

end