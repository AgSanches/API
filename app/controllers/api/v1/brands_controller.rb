module Api
  module V1
    class BrandsController < ApplicationController

      def index
        render json: Brand.all
      end

      def show
        render json: Brand.find(params[:id])
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