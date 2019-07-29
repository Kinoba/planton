module Api::V1
  class PlantsController < ApplicationController
    before_action :authenticate_user!, except: %i[index]

    def index
      @plants = Plant.all

      render json: @plants
    end

    def coucou
      render json: User.all
    end
  end
end
