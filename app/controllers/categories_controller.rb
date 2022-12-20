class CategoriesController < ApplicationController
  before_action :set_user
  def index
    # @categories = Transaktion.first.categorie_transaktions.each { |x| x.categorie }
    @categories = Categorie.all
    @categorie_total = 0
    @totals = []
    @categories.each_with_index do |categorie, _idx|
      if categorie.categorie_transaktions.length.positive?
        # categorie.categorie_transaktions.transaktion.amount
        categorie.categorie_transaktions.each_with_index do |some, idx|
          if @totals[idx]
            @totals[idx] += some.transaktion.amount
          else
            @totals[idx] = some.transaktion.amount
          end
        end
      else
        []
      end
    end
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
    @categorie.author = @user
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

def set_user
  @user = current_user
end
