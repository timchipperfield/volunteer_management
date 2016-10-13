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

  context 'volunteer exists already' do
    before do
      Volunteer.create(name: 'James Bond')
      visit '/volunteers'
    end

    scenario 'shows the volunteer\'s profile' do
      expect(page).to have_content('James Bond')
      expect(page).not_to have_content('There are no volunteers yet!')
    end

    scenario 'can delete existing users' do
      click_link('Profile for James Bond')
      click_link('Delete James Bond')
      expect(page).to have_content('There are no volunteers yet!')
      expect(page).to have_content('James Bond has been deleted')
    end

    scenario 'can edit volunteer data' do
      click_link('Profile for James Bond')
      click_link('Edit Information')
      fill_in('Tel', :with => 6789)
      fill_in('Email', :with => 'bond@bond.com')
      click_button('Submit Edits')
      expect(page).to have_content('6789')
      expect(page).to have_content('bond@bond.com')
    end

    scenario 'can view a particular volunteers profile' do
      click_link('Profile for James Bond')
      expect(page).to have_content("Volunteer Profile for")
    end
  end

end
