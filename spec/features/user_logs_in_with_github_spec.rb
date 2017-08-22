require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oath' do
    stub_omniauth

    visit root_path

    expect(page).to have_link('Sing in with Github')
    click_link 'Sign in with Github'

    expect(page).to have_content('Chantal Justamond')
    expect(page).to have_link('Logout')
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: 'github',
        uid: '12345678910',
        info: {
            email: 'cjustamm66@me.com',
            first_name: 'chantal',
            last_name: 'Justamond'
        },
        credentials: {
            token: 'abcdefg12345',
            refresh_token: 'abcdefg12345',
            expires_at: DateTime.now
        }
    })
  end
end