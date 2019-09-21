require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test "Validar Presenca: name" do
    category = Category.new
    assert_not category.save
  end

  test "Validar Exclusividade: name" do
    category = Category.new(name: "Categoria")
    category_clone = category.clone
    category.save
    assert_not category_clone.save
  end

end
