module Api
  module V1
    class SizesController < ApplicationController

      def create
        size = Size.new(size_params)

        if size.save
          render json: {status: 'SUCCESS', message:'Saved size', data:size},status: :ok
        else
          render json: {status: 'ERROR', message:'size not saved', data:size.errors},status: :unprocessable_entity
        end
      end

      def destroy
        size = Size.find(params[:id])
        size.destroy
        render json: {status: 'SUCCESS', message:'Deleted size', data:size},status: :ok
      end

      def update
        size = Size.find(params[:id])
        if size.update_attributes(size_params)
          render json: {status: 'SUCCESS', message:'Updated size', data:size},status: :ok
        else
          render json: {status: 'ERROR', message:'size not updated', data:size.errors},status: :unprocessable_entity
        end
      end

      private

      def size_params
        params.permit(:quantity, :product_id, :number)
      end
    end
  end
end