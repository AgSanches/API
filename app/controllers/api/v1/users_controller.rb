module Api
  module V1
    class UsersController < ApplicationController

      def index
        render json: User.all
      end

      def show
        render json: User.find(params[:id])
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: {status: 'SUCCESS', message:'Saved user', data:user},status: :ok
        else
          render json: {status: 'ERROR', message:'user not created', data:user.errors},status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message:'Deleted user', data:user},status: :ok
      end

      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: {status: 'SUCCESS', message:'Updated user', data:user},status: :ok
        else
          render json: {status: 'ERROR', message:'user not updated', data:user.errors},status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:login, :email, :password, :surnames, :street, :postalcode, :country, :city, :passport, :phone, :type)
      end
    end
  end
end
