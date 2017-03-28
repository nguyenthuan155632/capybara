require 'rails_helper'

feature 'Automate test - Devise demo', js: true do
  scenario 'sign up' do
    session = Capybara::Session.new(:selenium)

    session.visit '/users/sign_up'

    session.fill_in 'Email', with: FFaker::Internet.email
    session.fill_in 'Password', with: '123456'
    session.fill_in 'Password confirmation', with: '123456'

    session.click_button 'Sign up'

    expect(session).to have_content 'Welcome! You have signed up successfully.'
  end
end