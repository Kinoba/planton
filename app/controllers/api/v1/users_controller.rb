module Api
  module V1
    # User controller
    class UsersController < ApplicationController
      before_action :authenticate_user!

      def show
        render json: UserSerializer.new(current_user).serialized_json
      end
    end
  end
end
