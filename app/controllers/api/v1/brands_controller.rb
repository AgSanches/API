module Api
  module V1
    class BrandsController < ApplicationController
      def index
        @brands = Brand.all.with_attached_image
        render json: @brands.map { |brand|
          brand.as_json.merge({ image: url_for(brand.image) })
        }
      end

      def show
        brand = Brand.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded brand', data:brand, image: url_for(brand.image)},status: :ok
      end

      def create
        brand = Brand.new(brand_params)

        if brand.save
          render json: {status: 'SUCCESS', message:'Saved brand', data:brand},status: :ok
        else
          render json: {status: 'ERROR', message:'brand not saved', data:brand.errors},status: :unprocessable_entity
        end
      end

      def destroy
        brand = Brand.find(params[:id])
        brand.destroy
        render json: {status: 'SUCCESS', message:'Deleted brand', data:brand},status: :ok
      end

      def update
        brand = brand.find(params[:id])
        if brand.update_attributes(brand_params)
          render json: {status: 'SUCCESS', message:'Updated brand', data:brand},status: :ok
        else
          render json: {status: 'ERROR', message:'brand not updated', data:brand.errors},status: :unprocessable_entity
        end
      end

      private

      def brand_params
        params.permit(:name, :image)
      end
    end
  end
end