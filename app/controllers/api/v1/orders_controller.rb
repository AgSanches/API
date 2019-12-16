module Api
  module V1
    class OrdersController < ApplicationController

      before_action :authenticate, except: [:index, :show, :create, :ordersUsers]

      def index
        render json: Order.all
      end

      def ordersUsers
        render json: Order.where(user_id: params[:user_id]).order('created_at ASC').limit(10)
      end

      def show
        render json: Order.find(params[:id])
      end

      def create
        order = Order.new(orders_params)
        if order.save
          render json: {status: 'SUCCESS', message:'ORDER CREATED', data:order},status: :ok
        else
          render json: {status: 'ERROR', message:'ORDER NOT CREATED', data:order},status: :unprocessable_entity
        end
      end

      private
      def authenticate
        if session[:token] == nil
          redirect_to admin_index_path
        end
      end

      private
      def orders_params
        params.permit(:street, :city, :postalcode, :country, :passport, :phone, :methodship, :methodpayment, :user_id)
      end
    end
  end
end