require 'rails_helper'

RSpec.describe 'CategorieTransaktion', type: :model do
  before(:each) do
    @user = User.new(name: 'someone', email: 'someone@email.com', password: 'password')
    @user.confirm
    @categorie = Categorie.create(author: @user, name: 'FOOD', icon: 'some/fancy/url')
    @transaktion = Transaktion.create(author: @user, name: 'lunch', amount: 20)
    @categorie_transaktion = CategorieTransaktion.create(transaktion: @transaktion, categorie: @categorie)
  end

  describe 'Test for validations - CategorieTransaktion model ->' do
    it 'Tests for CategorieTransaktion creation' do
      expect(@categorie_transaktion).to be_valid
    end
  end
end
