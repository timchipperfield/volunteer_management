require 'rails_helper'

feature 'user accounts' do

  context 'user has not signed up yet' do

    scenario 'user can sign up at homepage' do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

  end

end
