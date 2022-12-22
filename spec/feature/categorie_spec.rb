require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
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
    visit new_user_session_path
    fill_in 'Email', with: 'someuser@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
  end

  describe 'Test for Categorie Views' do
    it 'should check for http status' do
      expect(page).to have_content('Signed in as')
      expect(page).to have_content('someuser@email.com')
    end

    it 'should check SIGN OUT button and SIGNUP' do
      click_button 'SIGN OUT'
      expect(page).to have_content('Signed out successfully')
      click_link 'SIGN UP'
      expect(page).to have_content('REGISTER')
    end
  end
end
