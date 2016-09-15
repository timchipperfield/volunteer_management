require 'rails_helper'

feature 'volunteers page' do
  context 'no volunteers added so far' do
    scenario 'the user sees all volunteers at the roots' do
      visit '/volunteers'
      expect(page).to have_content('There are no volunteers yet!')
    end

    scenario 'create new user' do
      visit '/volunteers'
      click_link('Add Volunteer')
      fill_in('Name', :with => 'James Brown' )
      fill_in('Tel', :with => 1234 )
      fill_in('Email', :with => 'james@brown.com' )
      click_button('Create Volunteer')
      expect(page).to have_content('James Brown')
    end
  end

  context 'volunteer exists withcontact details' do
    before do
      Volunteer.create(name: 'James Bond')
    end

    scenario 'shows the volunteer\'s profile' do
      visit '/volunteers'
      expect(page).to have_content('James Bond')
      expect(page).not_to have_content('There are no volunteers yet!')
    end
  end

end
