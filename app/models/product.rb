class Product < ApplicationRecord
  belongs_to :category
  
  validates :name, :category_id, presence: { message: 'não pode estar em branco' }
  validates :category_id, numericality: { only_integer: true, message: 'deve ser um numero' }
  validates :name, uniqueness: { message: 'já existe', case_sensitive: false }

  validates :category_id, :category, category_exists: true
end
