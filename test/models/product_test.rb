require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "Validar Presença: name" do
    product =  Product.new(category_id: 1)
    assert_not product.save
  end

  test "Validar Presença: category_id" do
    product =  Product.new(name: "Produto")
    assert_not product.save
  end

  test "Validar Numero: category_id" do
    product =  Product.new(name: "Produto", category_id: "1")
    assert_not product.save
  end

  test "Validar Exclusividade: name" do
    category = Category.create(name: "Categoria")
    product1 = Product.new(name: "Produto", category: category)
    product2 = product1.clone
    product1.save
    assert_not product2.save
  end

  test "Validar se existe categoria" do
    category = Category.create(name: "Categoria")
    product = Product.new(name: "Produto", category_id: category.id + 1)
    assert_not product.save
  end

end
