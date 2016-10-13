require 'rails_helper'

feature 'user accounts' do

  context 'user has not signed up yet' do

    scenario 'user can sign up at homepage' do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    scenario 'a user can sign up' do
      visit '/'
      click_link('Sign up')
      expect(page).to have_content('Sign up')
    end
  end

  context 'user has signed up' do
    before do
      Admin.create(email: 'Drangus@123.com', password: 123456)
      visit '/'
    end

    scenario 'user can start a new session' do
      click_link('Sign in')
      fill_in('Email', :with => 'Drangus@123.com')
      fill_in('Password', :with => 123456)
      click_button('Log in')
      expect(page).to have_content('Signed in successfully.')
    end


  end


end
