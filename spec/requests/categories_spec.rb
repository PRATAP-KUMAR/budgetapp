require 'rails_helper'

RSpec.describe 'Categories', type: :request do
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
    get categories_path(@categorie)
  end

  describe 'Test for Categorie Controller' do
    it 'should check for http status' do
      expect(response).to have_http_status(200)
    end

    it 'should check for rendering of page' do
      expect(response).to render_template('index')
    end

    it 'should check for create categorie page' do
      get new_category_path
      expect(response).to render_template('new')
    end
  end

  describe 'Test for Create Categorie page' do
    before(:each) do
      get new_category_path
    end

    it 'should check for content on categorie page' do
      expect(response.body).not_to include(@user.password)
    end

    it 'should check for content on categorie page' do
      expect(response.body).to include(@user.name)
    end
  end
end
