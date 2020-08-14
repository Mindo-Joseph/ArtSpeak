require 'rails_helper'
RSpec.describe 'Users', type: :feature do
    let(:user1) { User.create(username:'Kevin', fullname:'Hart Kevin')}
    let(:user2) { User.create(username: 'Vincent', fullname: 'Vincent Stones')}

    scenario 'can follow another user' do
        visit root_url
        fill_in 'Username', with: user1.username
        click_button 'Log in'
        visit users_path
        click_link 'Follow'
        visit root_url
        expect(page).to have_content("1\nFollowing")
    end
end