require 'rails_helper'

feature 'user sees basic information of the account' do
  before(:each) do
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  scenario 'as a logged in user I see' do
    VCR.use_cassete('user sees basic info') do
      visit '/'

      click_link 'Sign in with GitHub'

      expect(page).to have_selector('.avatar')
      expect(page).to have_selector('.name')
      expect(page).to have_selector('.login')
      expect(page).to have_selector('.bio')
      expect(page).to have_selector('.card')
      expect(page).to have_selector('.company')
      expect(page).to have_selector('.location')
      expect(page).to have_selector('.email')
      expect(page).to have_selector('.blog')
    end
  end
end