module Api
  module V1
    class ProductsController < ApplicationController

      before_action :authenticate, :except => [:create, :destroy, :update]

      def index
        render json: Product.all
      end

      def show
        render json: Product.find(params[:id])
      end

      def create
        product = Product.new(product_params)

        if product.save
          redirect_to admin_index_path
        else
          render json: {status: 'ERROR', message:'product not saved', data:product.errors},status: :unprocessable_entity
        end
      end

      def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          redirect_to admin_index_path
        else
          render json: {status: 'ERROR', message:'product not updated', data:product.errors},status: :unprocessable_entity
        end
      end

      private
      def authenticate
        if session[:token] == nil
          redirect_to admin_index_path
        end
      end

      private
      def product_params
        params.require(:product).permit(:name, :price, :discount, :isSale,
                      :description, :brand_id, :product_presentation,
                      :slider_photo, :isDestacado ,product_photos: [] )
      end
    end
  end
end