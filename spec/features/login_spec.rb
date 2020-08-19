require 'rails_helper'

RSpec.describe 'Log In', type: :feature do
  let(:user) { User.new(username: 'test', fullname: 'tester001') }
  scenario 'user cannot access site without logging in first' do
    visit root_url
    expect(page).to have_content('Please login')
  end
  scenario 'after logging in user should be directed to the main page' do
    user.save
    visit root_url
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content(user.username.to_s)
  end
  scenario 'error message is displayed if user is not found' do
    visit root_url
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content('User not found')
  end
end
