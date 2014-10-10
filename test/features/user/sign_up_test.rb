require 'test_helper'

feature 'As a site visitor, I want to be able to sign up for an account,
so that I can perform actions that require me to be logged in.' do
  scenario 'Sign Up' do
    visit '/'
    click_on 'Sign Up!'
    page.find('div.new_user').fill_in 'Email', with: 'test@example.com'
    page.find('div.new_user').fill_in 'Password', with: 'password'
    page.find('div.new_user').fill_in 'Password confirmation', with: 'password'
    page.find('div.new_user').click_on 'Sign Up'
    page.text.must_include 'Signed in as:'
  end
end
