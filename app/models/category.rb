class Category < ApplicationRecord
    has_many :products
    
    validates :name, presence: { message: 'não pode estar em branco' }
    validates :name, uniqueness: { message: 'já existe', case_sensitive: false }
end
