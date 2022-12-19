class Categorie < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categorie_transaktions

  validates :name, presence: true, length: { maximum: 25 }
  validates :icon, presence: true, length: { maximum: 250 }
end
