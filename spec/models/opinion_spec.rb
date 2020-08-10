require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'Opinion:' do
    let(:user) { User.new(username: 'test', fullname: 'tester test') }
    let(:opinion) { Opinion.new(text: 'This is a great app') }
    it 'is invalid if text is empty' do
      user.save
      opinion.user = user
      opinion.text = ''
      expect(opinion).to_not be_valid
    end
    it 'is VALID if created by a user' do
      user.save
      opinion.user = user
      expect(opinion).to be_valid
    end
    it 'is Invalid if more than 280 characters' do
      user.save
      opinion.user = user
      opinion.text = 'a' * 281
      expect(opinion).to_not be_valid
    end
  end
  context 'Associations' do
    it { should belong_to(:user) }
  end
end
