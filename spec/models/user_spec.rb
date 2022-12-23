require 'rails_helper'

RSpec.describe 'User', type: :model do
  before(:each) do
    @user = User.new(name: 'someone', email: 'someone@email.com', password: 'password')
  end

  describe 'Test for validations - User model ->' do
    it 'tests for user creation' do
      expect(@user).to be_valid
    end

    it 'tests for user.name' do
      expect(@user.name).to eq('someone')
    end

    it 'tests for user email' do
      @user.email = 'onesome@email.com'
      expect(@user.email).not_to eq('someone@email.com')
    end
  end
end
