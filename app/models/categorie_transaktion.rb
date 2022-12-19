class CategorieTransaktion < ApplicationRecord
  belongs_to :categorie
  belongs_to :transaktion
end
