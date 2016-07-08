require 'rails_helper'

describe User, type: :model do
  
  it 'has a valid factory' do
    expect(build(:user)).to be_valid 
  end

  it 'is invalid without a first name' do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name].count).to eq 1
  end

  it 'is invalid without a last name' do
    user = build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name].count).to eq 1
  end

  it 'is invalid without an email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email].count).to eq 1
  end

  it 'is invalid without a password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password].count).to eq 1
  end
    
  it 'is invalid with a duplicate email address' do
    create(:user, email: 'user@example.com')
    user = build(:user, email: 'user@example.com')
    user.valid?
    expect(user.errors[:email].count).to eq 1
  end

end