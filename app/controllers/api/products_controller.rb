module Api

  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /products [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def index
      @products = Product.all
      render json: @products
    end

    #GET /product/listByCategory/:category_id [IMPLEMENTED] [EXPOSED]
    def list_by_category
      category = Category.where(id: params[:category_id])
      if category.any? then
        @products = category.first.products
        if @products.any? then 
          render json: @products, status: 200
        else
          render json: { message: "Não há produtos associados a categoria informada" }, status: 404
        end
      else
        render json: { message: "Não foi encontrada a categoria informada" }, status: 404
      end
    end

    # GET /products/1 [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def show
      render json: @product
    end

    # POST /products [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1 [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1 [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def destroy
      @product.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :category_id)
      end
  end

end
