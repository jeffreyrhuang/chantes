require 'rails_helper'

describe Restaurant do
  it 'validates presence of name' do
    r = Restaurant.new()
    r.save
    expect(r.errors[:name].count).to eq 1
  end
end