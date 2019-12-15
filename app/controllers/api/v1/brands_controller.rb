module Api
  module V1
    class BrandsController < ApplicationController

      before_action :authenticate, except: [:index, :show, :getIndexBrands]

      def index
        render json: Brand.all
      end

      def getIndexBrands
        render json: Brand.all.order('updated_at ASC').limit('2')
      end

      def show
        render json: Brand.find(params[:id])
      end

      def create
        brand = Brand.new()
        brand.name = params[:brand][:name]
        brand.image = params[:brand][:image]

        if brand.save
          redirect_to admin_index_path
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
        brand = Brand.find(params[:id])
        if brand.update_attributes(brand_params)
          redirect_to admin_index_path
        else
          render json: {status: 'ERROR', message:'brand not updated', data:brand.errors},status: :unprocessable_entity
        end
      end

      private
        def authenticate
          if session[:token] == nil
            redirect_to admin_index_path
          end
        end

      private
      def brand_params
        params.require(:brand).permit(:name, :image)
      end
    end
  end
end