class CategoriesController < ApplicationController
  def index
    @categories = Transaktion.first.categorie_transaktions.each { |x| x.categorie.name }
  end
end
