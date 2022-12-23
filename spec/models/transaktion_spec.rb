require 'rails_helper'

RSpec.describe 'Transaktion', type: :model do
  before(:each) do
    @user = User.new(name: 'someone', email: 'someone@email.com', password: 'password')
    # @user.confirm
    @categorie = Categorie.create(author: @user, name: 'FOOD', icon: 'some/fancy/url')
    @transaktion = Transaktion.create(author: @user, name: 'lunch', amount: 20)
  end

  describe 'Test for validations - Transaktion model ->' do
    it 'Tests for Transaktion creation' do
      expect(@transaktion).to be_valid
    end

    it 'Tests for Transaktion.amount creation' do
      expect(@transaktion.amount).to eq(20)
    end
  end
end
