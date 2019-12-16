module Api
  module V1
    class IndexPanelInfosController < ApplicationController

      before_action :authenticate, :except => [:index, :show, :getPanelByType]

      def index
        render json: IndexPanelInfo.all
      end

      def show
        render json: IndexPanelInfo.find(params[:id])
      end

      def getPanelByType
        render json: IndexPanelInfo.where(type_panel: params[:type_panel])
      end

      def create
        panel = IndexPanelInfo.new(panel_params)

        if panel.save
          redirect_to admin_index_path
        else
          render json: {status: 'ERROR', message:'product not saved', data: panel.errors},status: :unprocessable_entity
        end
      end

      def update
        panel = IndexPanelInfo.find(params[:id])
        if panel.update_attributes(panel_params)
          redirect_to admin_index_path
        else
          render json: {status: 'ERROR', message:'product not updated', data:panel.errors},status: :unprocessable_entity
        end
      end

      private
      def authenticate
        if session[:token] == nil
          render json: {status: 'ERROR', message: "No se ha enviando ningún token de autenticación"}, :status => :forbidden
        end
      end

      private
      def panel_params
        params.require(:index_panel_info).permit(:title, :text, :type_panel ,:image)
      end
    end
  end
end