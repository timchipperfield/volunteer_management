require 'rails_helper'

feature 'user accounts' do

  context 'user has not signed up yet' do

    scenario 'user can sign up at homepage' do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    scenario 'user cannot view volunteers' do
      visit '/volunteers'
      expect(page).to have_content('You need to sign in or sign up before continuing')
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

    scenario 'user can log out' do
      click_link('Sign in')
      fill_in('Email', :with => 'Drangus@123.com')
      fill_in('Password', :with => 123456)
      click_button('Log in')
      click_link('Sign out')
      expect(page).to have_content('Signed out successfully.')
    end


  end


end
