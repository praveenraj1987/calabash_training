Given(/^the app has launched$/) do
  wait_for do
    !query("*").empty?
  end
end

And(/^I login with following credential on login page$/) do |login_table|
  login_data = login_table.hashes.first
  App.login_screen_page.login(login_data['username'], login_data['password'])
end

Then (/^I should be on First Screen$/) do
  expect(App.current_page).to eq(App.first_screen_page)
end


Then (/^I should be on Login Screen$/) do
  expect(App.current_page).to eq(App.login_screen_page)
end


And(/^It Should have Description$/) do

end

When(/^I Navigate to Next Screen$/) do
  App.current_page.goto_next_page
end


Then(/^I should see a login error dialog$/) do
  App.current_page.error_dialog_is_shown
end


When(/^I dismiss the error dialog$/) do
  App.current_page.dismiss_error_dialog
end

When(/^I Navigate back$/) do
  App.current_page.back
end

Then(/^I should be on Second Screen$/) do
  expect(App.current_page).to eq(App.second_screen_page)
end