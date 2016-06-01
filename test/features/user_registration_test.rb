require "test_helper"

class UserRegistrationTest < Capybara::Rails::TestCase
  test "user can register" do
    visit root_path
    visit new_user_registration_path
    fill_in('Email', :with => 'user@example.com')
    fill_in('Password', :with => '123cool')
    fill_in('Password confirmation', :with => '123cool')
    click_button('Sign up')
    page.current_path.must_equal root_path
    assert_text 'Welcome! You have signed up successfully'
  end
end
