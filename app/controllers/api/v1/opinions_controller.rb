module Api
  module V1
    class OpinionsController < ApplicationController

      def create
        opinion = Opinion.new(opinion_params)

        if opinion.save
          render json: {status: 'SUCCESS', message:'Saved opinion', data:opinion},status: :ok
        else
          render json: {status: 'ERROR', message:'opinion not saved', data:opinion.errors},status: :unprocessable_entity
        end
      end
      
      def update
        opinion = Opinion.find(params[:id])
        if opinion.update_attributes(opinion_params)
          render json: {status: 'SUCCESS', message:'Updated opinion', data:opinion},status: :ok
        else
          render json: {status: 'ERROR', message:'opinion not updated', data:opinion.errors},status: :unprocessable_entity
        end
      end

      private

      def opinion_params
        params.permit(:title, :body, :product_id, :user_id)
      end
    end
  end
end