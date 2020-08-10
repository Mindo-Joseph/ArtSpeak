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
  context 'with valid profile photo and cover Image' do
    let(:user1) { User.new(username:'bob', fullname: 'the lego guy')}
    it 'saves user profile photo' do
      user1.save!
      saved_file = user1.photo.attach(io: File.open("./spec/fixtures/files/user1.jpg"),filename: "face.jpg", content_type: "image/jpg")
      expect(user1.photo.attached?).to be true
    end
    it 'saves a user cover Image' do
      user1.save!
      saved_file = user1.photo.attach(io: File.open("./spec/fixtures/files/cover1.jpg"),filename: "cover.jpg", content_type: "image/jpg")
      expect(user1.photo.attached?).to be true
    end
  end
end
