require 'rails_helper'

feature 'welcome page' do
  scenario 'should welcome users to page' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end
end
