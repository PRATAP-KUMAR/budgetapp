require 'rails_helper'

RSpec.describe 'Categorie', type: :model do
  before(:each) do
    @user = User.new(name: 'someone', email: 'someone@email.com', password: 'password')
    # @user.confirm
    @categorie = Categorie.create(author: @user, name: 'FOOD', icon: 'some/fancy/url')
  end

  describe 'Test for validations - Categorie model ->' do
    it 'Tests for Categorie creation' do
      expect(@categorie).to be_valid
    end

    it 'Tests for Categorie.icon creation' do
      expect(@categorie.icon).to eq('some/fancy/url')
    end

    it 'Tests for Categorie name is not valid (user.name > 25)' do
      food_name = 'abcdefghijklmnopqrstuvwxyz'
      @categorie2 = Categorie.create(author: @user, name: food_name, icon: 'some/fancy/url')
      expect(@categorie2).not_to be_valid
    end
  end
end
