require 'rails_helper'

feature 'Automate test - Create a new profile' do
  scenario 'submit profile' do
    session = Capybara::Session.new(:selenium)

    session.visit '/users/sign_in'
    p "====================================="
    p session.driver.current_url
    session.fill_in 'Email', with: 'nt.apple.it@gmail.com'
    session.fill_in 'Password', with: '123456'
    session.click_button 'Log in'

    session.visit '/profiles'

    session.find_link('New Profile').click

    session.fill_in 'Fullname', with: FFaker::Name.name
    session.fill_in 'Email', with: FFaker::Internet.email
    
    session.select "1992", from: "profile[birthdate(1i)]"
    session.select "October", from: "profile[birthdate(2i)]"
    session.select "20", from: "profile[birthdate(3i)]"
    session.select "22", from: "profile[birthdate(4i)]"
    session.select "30", from: "profile[birthdate(5i)]"

    session.check('Is male')
    session.fill_in 'Address', with: FFaker::Address.street_address
    session.fill_in 'Phone', with: FFaker::PhoneNumber.phone_number

    session.click_button 'Create Profile'

    session.save_and_open_screenshot

    expect(session).to have_content 'Profile was successfully created'
  end
end