class CategoriesController < ApplicationController
  before_action :set_author

  def index
    @categories = Categorie.all
  end

  def new
    @categorie = Categorie.new
  end

  def show
    @categorie = Categorie.find(params[:id])
    @transaktions = []
    @categorie.categorie_transaktions.order(:id).each do |some|
      @transaktions.push(some.transaktion)
    end
  end

  def create
    @categorie = Categorie.new(categorie_params)
    @categorie.author = @author
    if @categorie.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def categorie_params
    params.require(:categorie).permit(:name, :icon)
  end
end

private

def set_author
  @author = current_user
end
