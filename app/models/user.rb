class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories, foreign_key: 'author_id'
  has_many :transaktions, foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 25 }
end
