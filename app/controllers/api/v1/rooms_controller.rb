module Api
  module V1
    class RoomsController < ApplicationController
			def index
        @rooms = Room.order('created_at')
        render json: {status: 'SUCCESS', message: 'Loaded rooms', data:@rooms}, status: :ok
      end
        
      def show
        @room = Room.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded room', data:@room}, status: :ok
      end
        
      def create
        @room = Room.new(room_params)
        
        if @room.save
          render json: {status: 'SUCCESS', message: 'Room is saved', data:@room}, status: :ok
        else
          render json: {status: 'Error', message: 'Room is not saved', data:@Room.errors}, status: :unprocessable_entity
        end
    	end
        
      def update
        @room = Room.find(params[:id])
        
        if @room.update_attributes(room_params)
          render json: {status: 'SUCCESS', message: 'Room is updated', data:@room}, status: :ok
        else
          render json: {status: 'Error', message: 'Room is not updated', data:@room.errors}, status: :unprocessable_entity
        end
      end
        
      def destroy
        @room = Room.find(params[:id])
        @room.destroy
        
        render json: {status: 'SUCCESS', message: 'Room successfully deleted', data:@room}, status: :ok
      end
        
      private
      def room_params
        params.permit(:name)
      end
    end
  end
end