require 'rails_helper'

feature 'Automate test - Create a new profile' do
  scenario 'submit profile' do
    session = Capybara::Session.new(:selenium)

    session.visit 'http://127.0.0.1:3000/profiles'

    sleep 2

    session.find_link('New Profile').click

    session.fill_in 'Fullname', with: FFaker::Name.name
    session.fill_in 'Email', with: FFaker::Internet.email
    # fill_in "Birthdate", with: Date.today
    session.check('Is male')
    session.fill_in 'Address', with: FFaker::Address.street_address
    session.fill_in 'Phone', with: FFaker::PhoneNumber.phone_number

    sleep 1

    session.click_button 'Create Profile'

    sleep 1

    session.save_and_open_screenshot

    expect(session).to have_content 'Profile was successfully created'
  end
end