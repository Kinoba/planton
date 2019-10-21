# frozen_string_literal: true

module Api
  module V1
    # Plants controller
    class PlantsController < ApplicationController
      # before_action :authenticate_user!, except: :index
      before_action :find_plant, only: [:show, :update, :destroy]

      def index
        @plants = Plant.where(public: true).with_attached_pictures
        
        render json: PlantSerializer.new(@plants).serialized_json
      end

      def show
        render json: @plant
      end

      def new; end

      def edit; end

      def create
        plant = Plant.new(plant_params)
        plant.save!

        render json: plant
      end

      def update
        @plant.update!(plant_params)

        render json: @plant
      end

      def destroy
        @plant.destroy!

        head :no_content
      end

      def generate_gifs
        GifGeneratorJob.perform_later

        head :no_content
      end

      private

      def plant_params
        params.require(:plant).permit(
          :name, :start_date, :picture_reminder, :water_reminder, :needs_processing, :public, :user_id
        )
      end

      def find_plant
        @plant = Plant.find_by!(id: params[:id])
      end
    end
  end
end