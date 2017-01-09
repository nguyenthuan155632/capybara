require 'rails_helper'

feature 'Automate test - Execute script', js: true do
  scenario 'profiles page' do
    login_and_logout_with_warden do
      session = Capybara::Session.new(:selenium)

      session.visit 'http://127.0.0.1:3000/users/sign_in'
      session.fill_in 'Email', with: 'nt.apple.it@gmail.com'
      session.fill_in 'Password', with: '123456'
      session.click_button 'Log in'

      sleep 3

      session.visit 'http://127.0.0.1:3000/profiles'

      # session.first("table tbody tr")
      session.find('table tbody tr', match: :first)
      sleep 3
      session.execute_script '$("table tbody tr:first-child").css("background-color", "green")'

      sleep 3

      session.find('table tbody tr:first-child td a[data-method="delete"]').click
      sleep 3
      session.driver.browser.switch_to.alert.accept
      
      sleep 3

      expect(session).to have_content 'Profile was successfully destroyed'
    end
  end
end