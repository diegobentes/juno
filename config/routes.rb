Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'category/listAll', to: 'categories#index'
    get 'product/listByCategory/:category_id', to: 'products#list_by_category', as: 'product_listByCategory'
  end  
end
