# require 'rails_helper'

# RSpec.describe 'users/index', type: :view do
#   before(:each) do
#     assign(:users, [
#              User.create!(
#                username: 'John',
#                fullname: 'Mike Fullname'
#              ),
#              User.create!(
#                username: 'Username',
#                fullname: 'Fullname'
#              )
#            ])
#   end

#   it 'renders a list of users' do
#     render
#     assert_select 'tr>td', text: 'Username'.to_s, count: 1
#     assert_select 'tr>td', text: 'Fullname'.to_s, count: 1
#     assert_select 'tr>td', text: 'John'.to_s, count: 1
#     assert_select 'tr>td', text: 'Mike Fullname'.to_s, count: 1
#   end
# end
