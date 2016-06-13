require 'spec_helper'

describe Review do
  it 'validates ratings' do
    r = Review.new()
    r.save
    expect(r.errors[:rating].count).to eq 1
    r.rating = 0
    r.save
    expect(r.errors[:rating].count).to eq 1
    r.rating = 6
    r.save
    expect(r.errors[:rating].count).to eq 1
    r.rating = 5
    r.save
    expect(r.errors[:rating].count).to eq 0
  end
end