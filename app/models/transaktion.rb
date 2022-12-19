class Transaktion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categorie_transaktions
end
