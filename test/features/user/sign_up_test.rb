require 'test_helper'

feature 'As a site visitor, I want to be able to sign up for an account,
so that I can perform actions that require me to be logged in.' do
  scenario 'Sign Up' do
    visit 'questions#index'
    page.text.must_include 'QAPets'
    page.wont_have_content 'There was a problem with your sign up'
  end
end
