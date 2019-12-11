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
        #1 is normal user, 2 Admin
        user.type_user = 1

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
          render json: {status: 'ERROR', message:'user not updated', data:user.errors},status: :bad_request
        end
      end

      def login
        user = User.find_by_email(params[:email])
        if user.password == params[:password]
          render json: {status: "SUCCESS", message: "User login", data:user}, status: :ok
        else
          render json: {status: 'ERROR', message:'user not valid'},status: :bad_request
        end
      end

      def admin
        user = User.find_by_email(params[:email])
        if user.type_user == 2 and user.password == params[:password]
          render json: {status: "SUCCESS", message: "Admin login"}, status: :ok
        else
          render json: {status: 'ERROR', message:'Admin not valid'},status: :forbidden
        end
      end

      private
      def user_params
        params.permit(:login, :email, :password, :name, :surnames, :street, :postalcode, :country, :city, :passport, :phone)
      end

      private
      def login_params
        params.permit(:email, :password)
      end
    end
  end
end
