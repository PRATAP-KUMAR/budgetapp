class TransaktionsController < ApplicationController
  before_action :set_author

  def index
    @categorie = Categorie.find(params[:category_id])
    @transaktions = @author.transaktions.all
  end

  def new
    @categories = Categorie.all
    @categorie = Categorie.find(params[:category_id])
    @transaktion = Transaktion.new
  end

  def create
    @categorie = Categorie.find_by(cat_params)
    @transaktion = @author.transaktions.new(transaktion_params)
    return unless @transaktion.save

    @categorie_transaktion = CategorieTransaktion.new(transaktion: @transaktion, categorie: @categorie)
    redirect_to authenticated_root_path if @categorie_transaktion.save
  end

  private

  def transaktion_params
    params.require(:transaktion).permit(:name, :amount)
  end

  def cat_params
    params.require(:transaktion).permit(:id)
  end
end

private

def set_author
  @author = current_user
end
