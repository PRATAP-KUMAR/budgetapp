require 'rails_helper'

RSpec.describe 'Transaktions', type: :feature do
  before(:each) do
    @user = User.new(
      name: 'SOMEUSER',
      email: 'someuser@email.com',
      password: 'password'
    )
    # @user.confirm
    @categorie = Categorie.create(
      author: @user,
      name: 'GARDEN MANAGMENT',
      icon: 'some/url'
    )
    @transaktion = Transaktion.create(
      author: @user,
      name: 'ROSE FLOWERS',
      amount: 200
    )
    @cat_tran = CategorieTransaktion.create(
      categorie: @categorie,
      transaktion: @transaktion
    )
    visit new_user_session_path
    fill_in 'Email', with: 'someuser@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
  end

  describe 'Test for Transaction views' do
    it 'should check for http status' do
      visit category_transaktions_path(@categorie)
      expect(page).to have_content('200$')
      expect(page).to have_content('Total Amount')
    end
  end
end
