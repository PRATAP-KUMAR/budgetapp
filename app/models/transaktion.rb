class Transaktion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categorie_transaktions
  has_many :categories, through: :categorie_transaktions

  validates :author_id, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
