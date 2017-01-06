require 'rails_helper'

feature 'Create a new profile' do
  scenario 'submit profile' do
    visit new_profile_path

    fill_in 'Fullname', with: FFaker::Name.name
    fill_in 'Email', with: FFaker::Internet.email
    # fill_in "Birthdate", with: Date.today
    check('Is male')
    fill_in 'Address', with: FFaker::Address.street_address
    fill_in 'Phone', with: FFaker::PhoneNumber.phone_number

    click_button 'Create Profile'

    expect(page).to have_content 'Profile was successfully created'
  end
end