require 'rails_helper'

RSpec.describe User, type: :model do
  context 'username' do
    let(:user) { User.new(fullname: 'Joe Mindo')}
    it 'is invalid if not present' do
      user.username = ''
      expect(user).to_not be_valid
    end

    it 'is valid if present' do
      user.username = 'Joe'
      expect(user).to be_valid
    end
    it 'should have more than 3 characters' do
      user.username = 'jo'
      expect(user).to_not be_valid
    end
    it 'should have not more than 20 chars' do
      user.username = 'g'*21
      expect(user).to_not be_valid
    end
  end
  context 'fullname' do
    let(:user) { User.new(username: 'Joe')}
    it 'is invalid if not present' do
      user.fullname = ''
      expect(user).to_not be_valid
    end
  end
end
