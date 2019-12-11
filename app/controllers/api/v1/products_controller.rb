module Api
  module V1
    class ProductsController < ApplicationController

      def index
        render json: Product.all
      end

      def show
        render json: Product.find(params[:id])
      end

      def create
        product = Product.new(product_params)

        if product.save
          render json: {status: 'SUCCESS', message:'Saved product', data:product},status: :ok
        else
          render json: {status: 'ERROR', message:'product not saved', data:product.errors},status: :unprocessable_entity
        end
      end

      def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {status: 'SUCCESS', message:'Deleted product', data:product},status: :ok
      end

      def update
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: {status: 'SUCCESS', message:'Updated product', data:product},status: :ok
        else
          render json: {status: 'ERROR', message:'product not updated', data:product.errors},status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.permit(:name, :price, :discount, :isSale,
                      :description, :brand_id, :product_presentation,
                      :slider_photo, :isDestacado ,product_photos: [] )
      end
    end
  end
end