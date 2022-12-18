class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    redirect_to categories_path if user_signed_in?
  end
end
