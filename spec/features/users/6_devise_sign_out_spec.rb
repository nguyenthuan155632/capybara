require 'rails_helper'

feature 'Automate test - Devise demo', js: true do
  scenario 'sign out' do
    session = Capybara::Session.new(:selenium)

    session.visit 'http://127.0.0.1:3000/users/sign_in'

    sleep 3

    session.fill_in 'Email', with: 'nt.apple.it@gmail.com'
    session.fill_in 'Password', with: '123456'
    session.check('Remember me')

    sleep 3

    session.click_button 'Log in'

    sleep 3

    session.find_link('SignOut').click

    sleep 3

    expect(session).to have_content 'Signed out successfully.'

    sleep 3
  end
end