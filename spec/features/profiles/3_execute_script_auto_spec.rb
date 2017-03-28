require 'rails_helper'

feature 'Automate test - Execute script', js: true do
  scenario 'profiles page' do
    session = Capybara::Session.new(:selenium)

    session.visit '/users/sign_in'
    p "====================================="
    p session.driver.current_url
    session.fill_in 'Email', with: 'nt.apple.it@gmail.com'
    session.fill_in 'Password', with: '123456'
    session.click_button 'Log in'

    session.visit '/profiles'

    # session.first("table tbody tr")
    session.find('table tbody tr', match: :first)
    session.execute_script '$("table tbody tr:first-child").css("background-color", "green")'

    session.find('table tbody tr:first-child td a[data-method="delete"]').click
    session.driver.browser.switch_to.alert.accept
    
    expect(session).to have_content 'Profile was successfully destroyed'
  end
end