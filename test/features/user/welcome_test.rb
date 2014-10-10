require 'test_helper'

feature 'As a site visitor, I want to arrive on the home page' do
  scenario 'Root route should be questions#index' do
    visit '/'
    page.text.must_include 'QAPets'
    page.wont_have_content '404'
  end
end
