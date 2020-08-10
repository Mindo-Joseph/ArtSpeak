require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Association' do
    let(:user1) { User.new(username: 'test', fullname: 'test subject') }
    let(:user1) { User.new(username: 'tester', fullname: 'testing subject') }
    let(:following) { Following.new }
    it { should belong_to(:followed_user) }
    it { should belong_to(:follower) }
  end
end
