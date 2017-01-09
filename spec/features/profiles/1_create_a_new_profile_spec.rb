require 'rails_helper'

feature 'Create a new profile' do
  scenario 'submit profile' do
    login_and_logout_with_warden do
        visit new_profile_path

        fill_in 'Fullname', with: FFaker::Name.name
        fill_in 'Email', with: FFaker::Internet.email

        select "1992", from: "profile[birthdate(1i)]"
        select "October", from: "profile[birthdate(2i)]"
        select "20", from: "profile[birthdate(3i)]"
        select "22", from: "profile[birthdate(4i)]"
        select "30", from: "profile[birthdate(5i)]"

        check('Is male')
        fill_in 'Address', with: FFaker::Address.street_address
        fill_in 'Phone', with: FFaker::PhoneNumber.phone_number

        click_button 'Create Profile'

        expect(page).to have_content 'Profile was successfully created'

        # page.has_content?('Profile was successfully created')


        ##############
        # Scoping
        ##############

        visit profiles_path

        within('table') do
        end

        within('#profiles-table', text: "Should be a caption") do
        end

        within_table('profiles-table') do
        end

        within_table(text: 'Should be a caption') do 
        end
        
    end
  end
end