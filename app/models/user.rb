class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories, foreign_key: 'author_id', class_name: 'Categorie'
  has_many :transaktions, foreign_key: 'author_id', class_name: 'Transaktion'

  validates :name, presence: true, length: { maximum: 25 }
  ROLES = %i[admin default].freeze
end
