module Api
  module V1
    class SizesController < ApplicationController

      def create
        size = Size.new(size_params)

        if size.save
          redirect_to manageSize_path(params[:size][:product_id])
        else
          render json: {status: 'ERROR', message:'size not saved', data:size.errors},status: :unprocessable_entity
        end
      end

      def update
        size = Size.find(params[:size][:id])
        if size.update_attributes(size_params)
          redirect_to manageSize_path(params[:size][:product_id])
        else
          render json: {status: 'ERROR', message:'size not updated', data:size.errors},status: :unprocessable_entity
        end
      end

      private

      def size_params
        params.require(:size).permit(:quantity, :product_id, :number)
      end
    end
  end
end