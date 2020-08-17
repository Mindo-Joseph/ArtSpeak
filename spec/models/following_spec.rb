require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Association' do
    it { should belong_to(:followed_user) }
    it { should belong_to(:follower) }
  end
  context 'request' do
    let(:user1) { User.create(username: 'test', fullname: 'test subject') }
    let(:user2) { User.create(username: 'tester', fullname: 'testing subject') }
    it 'should associate a new following with the user' do
      Following.create(FollowerId: user1.id, FollowedId: user2.id)
      expect(user1.followings.count).to eq(1)
    end
    it 'unfollowing reduces follower count' do
      Following.create(FollowerId: user1.id, FollowedId: user2.id)
      Following.find_by(FollowerId: user1.id, FollowedId: user2.id).destroy
      expect(user2.followers.count).to eq(0)
    end
    it 'increases follower count after following' do
      Following.create(FollowerId: user1.id, FollowedId: user2.id)
      expect(user2.followers.count).to eq(1)
    end
  end
end
