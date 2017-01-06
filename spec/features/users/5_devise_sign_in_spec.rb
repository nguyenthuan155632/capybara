require 'rails_helper'

feature 'Automate test - Devise demo', js: true do
  scenario 'sign in' do
    session = Capybara::Session.new(:selenium)

    session.visit 'http://127.0.0.1:3000/users/sign_in'

    sleep 2

    session.fill_in 'Email', with: 'nt.apple.it@gmail.com'
    session.fill_in 'Password', with: '123456'
    session.check('Remember me')

    sleep 2

    session.click_button 'Log in'

    expect(session).to have_content 'Signed in successfully.'

    sleep 2
  end
end