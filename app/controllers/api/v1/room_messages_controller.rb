module Api
  module V1
    class RoomMessagesController < ApplicationController
			def index
        @messages = RoomMessage.order('created_at')
        render json: {status: 'SUCCESS', message: 'Loaded all messages', data:@messages}, status: :ok
      end
        
      def index
        @messages = RoomMessage.where(:room_id => params[:room_id])
        render json: {status: 'SUCCESS', message: 'Loaded messages in this chat room', data:@messages}, status: :ok
      end
        
      def create
        @message = RoomMessage.new(message_params)
        
        if @message.save
          ActionCable.server.broadcast("MessagesChannel", message_params)
          render json: {status: 'SUCCESS', message: 'Message is saved', data:@message}, status: :ok
        else
          render json: {status: 'Error', message: 'Message is not saved', data:@message.errors}, status: :unprocessable_entity
        end
    	end
        
      def update
        @message = RoomMessage.find(params[:id])
        
        if @message.update_attributes(message_params)
          render json: {status: 'SUCCESS', message: 'Message is updated', data:@message}, status: :ok
        else
          render json: {status: 'Error', message: 'Message is not updated', data:@message.errors}, status: :unprocessable_entity
        end
      end
        
      def destroy
        @message = RoomMessage.find(params[:id])
        @message.destroy
        
        render json: {status: 'SUCCESS', message: 'Message successfully deleted', data:@message}, status: :ok
      end
        
      private
      def message_params
        params.permit(:room_id, :user_id, :message)
      end
    end
  end
end