require 'rails_helper'

RSpec.describe 'Homepage', type: :feature do
  let(:user) { User.new(username: 'mikey', fullname: 'Michael Angelo') }
  let(:user2) { User.new(username: 'alice', fullname: 'alice jane') }
  scenario 'has a form to post opinion' do
    user.save
    visit root_url
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_selector :css, 'input'
  end
  scenario 'has a side bar with following count' do
    user.save
    visit root_url
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content('Following')
  end
  scenario 'has a side bar with follower count' do
    user.save
    visit root_url
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content('Followers')
  end
  scenario 'has a side bar with who to follow tab' do
    user.save
    visit root_url
    fill_in 'Username', with: user.username
    click_button 'Log in'
    expect(page).to have_content('who to follow')
  end
end
