module Api
  module V1
    # Plants controller
    class PlantsController < ApplicationController
      before_action :authenticate_user!

      def index
        @plants = Plant.all

        render json: @plants
      end

      def show; end

      def new; end

      def edit; end

      def create
        plant = Plant.new(plant_params)
        if plant.save
          render json: plant
        else
          render json: plant.errors
        end
      end

      def update; end

      def destroy; end

      private

      def plant_params
        params.require(:plant).permit(:name, :start_date, :screenshot_reminder, :user_id)
      end
    end
  end
end
