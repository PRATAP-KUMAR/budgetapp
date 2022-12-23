require 'rails_helper'

RSpec.describe 'Transaktions', type: :request do
  before(:each) do
    @user = User.new(
      name: 'SOMEUSER',
      email: 'someuser@email.com',
      password: 'password'
    )
    # @user.confirm
    sign_in @user
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
    get category_transaktions_path(@categorie)
  end

  describe 'Test for Transaktion Controller' do
    it 'should check for http status' do
      expect(response).to have_http_status :ok
    end

    it 'should check for rendering of index page' do
      expect(response).to render_template('index')
    end
  end

  describe 'Test for Create Transaction page' do
    before(:each) do
      get new_category_transaktion_path(@categorie)
    end

    it 'should check for content on categorie page' do
      expect(response.body).not_to include(@categorie.icon)
    end

    it 'should check for content on categorie page' do
      expect(response.body).to include(@categorie.name)
    end
  end
end
