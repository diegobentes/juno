module Api
  class CategoriasController < ApplicationController
    def index
      @categorias = Categoria.all
      render json: @categorias
    end
  end
end