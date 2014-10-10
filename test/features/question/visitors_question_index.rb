require 'test_helper'

feature 'visitors should be able to see question listing' do
  scenario 'with existing questions' do
    visit '/'
    page.text.must_include questions(:ribbit).title
  end
end
