require 'rails_helper'

feature 'volunteers page' do
  context 'no volunteers added so far' do
    scenario 'the user sees all volunteers at the roots' do
      visit '/volunteers'
      expect(page).to have_content('There are no volunteers yet!')
    end
  end

  context 'volunteer is added withcontact details' do
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
