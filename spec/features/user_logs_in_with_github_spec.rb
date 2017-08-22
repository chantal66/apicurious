require 'rails_helper'


RSpec.feature 'user' do
  before(:each) do
    Capybara.app = Apicurious::Application
    stub_omniauth
  end
  it 'logs in using github' do
    VCR.use_cassette('user_logs_in_with_github') do
      visit '/'

      assert_equal 200, page.status_code

      click_link 'Sign in with GitHub'

      assert_equal "/", current_path

      expect(page).to have_content('Chantal Justamond')
      expect(page).to have_link('Logout')
    end
  end
end