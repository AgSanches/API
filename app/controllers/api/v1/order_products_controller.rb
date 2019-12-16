module Api
  module V1
    class OrderProductsController < ApplicationController

      before_action :authenticate, except: [:index, :show, :create]

      def index
        render json: OrderProduct.where(:order_id => params[:id])
      end

      def show
        render json: OrderProduct.find(params[:id])
      end

      def create
        orderProduct = OrderProduct.new(orders_params)
        product = Product.find(params[:product_id])

        if product.isSale
          price = (1 - product.discount/100) * product.price
        else
          price = product.price
        end

        orderProduct.unitPrice = price
        orderProduct.totalPrice = price * Integer(params[:quantity])

        if orderProduct.save
          render json: {status: 'SUCCESS', message:'ORDER PRODUCT CREATED', data: orderProduct},status: :ok
        else
          render json: {status: 'ERROR', message:'ORDER PRODUCT NOT CREATED', data:orderProduct},status: :unprocessable_entity
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
        params.permit(:product_id, :order_id, :quantity, :unitPrice, :totalPrice)
      end
    end
  end
end