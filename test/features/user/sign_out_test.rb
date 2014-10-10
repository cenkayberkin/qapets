require 'test_helper'

feature 'As the site owner, I want to sign out a user to prevent fraud' do
  scenario 'Sign Out' do
    visit '/'
    sign_in(users(:example_user))
    click_on 'Sign Out'
    page.text.must_include 'Sign Up'
    page.wont_have_content 'Signed in as:'
  end
end
