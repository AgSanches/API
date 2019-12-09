module Api
  module V1
    class ProductController < ApplicationController
      def index
        products = Product.all
        render json: products.map { |product|
          product.as_json.merge(
              {
                  slider_photo: url_for(product.slider_photo),
                  slider_photo: url_for(product.slider_photo)
              }
          )
        }
      end

      def show
        product = Product.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded product', data:product, image: url_for(product.image)},status: :ok
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
        params.permit(:name, :image)
      end
    end
  end
end