module Api

  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    # GET /categories [IMPLEMENTED] [EXPOSED]
    def index
      @categories = Category.all
      if @categories.any? then
        render json: @categories, status: 200
      else
        render json: { message: "Não há categorias cadastradas" }, status: 404
      end
    end

    # GET /categories/1 [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def show
      render json: @category
    end

    # POST /categories [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def create
      @category = Category.new(category_params)

      if @category.save
        render json: @category, status: :created, location: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /categories/1 [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    # DELETE /categories/1 [PARTTIALLY IMPLEMENTED] [NOT EXPOSED]
    def destroy
      @category.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name)
      end
  end

end
