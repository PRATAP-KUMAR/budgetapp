class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @user = current_user
    redirect_to categories_path if user_signed_in?
  end

  # private
  # def user_params
  #   params.require(:user).permit(:id)
  # end
end
