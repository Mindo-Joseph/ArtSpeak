require 'rails_helper'

RSpec.describe 'SignUp', type: :feature do
  scenario 'via username' do
    visit sign_up_path
    expect(page).to have_content('username')
  end
end
