require 'rails_helper'

feature 'Automate test - Devise demo', js: true do
  scenario 'sign out' do
    session = Capybara::Session.new(:selenium)

    session.visit '/users/sign_in'

    session.fill_in 'Email', with: 'nt.apple.it@gmail.com'
    session.fill_in 'Password', with: '123456'
    session.check('Remember me')

    session.click_button 'Log in'

    session.find_link('SignOut').click

    expect(session).to have_content 'Signed out successfully.'
  end
end