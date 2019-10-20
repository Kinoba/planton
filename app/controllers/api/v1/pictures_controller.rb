module Api
  module V1
    # Plants controller
    class PicturesController < ApplicationController
      before_action :authenticate_user!
      before_action :find_plant

      def create
        @plant.pictures.attach(pictures_params[:pictures])

        render json: @plant
      end

      def destroy
        # @plant.destroy!

        # head :no_content
      end

      private

      def pictures_params
        params.require(:plant).permit(:pictures, :user_id)
      end

      def find_plant
        @plant = current_user.plants.find_by!(id: params[:plant_id])
      end
    end
  end
end