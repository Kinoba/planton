# frozen_string_literal: true

# Single point of entry for the errors
module JSONErrors
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/BlockLength
  included do
    rescue_from StandardError,                      with: :render_500
    rescue_from ActiveRecord::RecordNotFound,       with: :render_404 # Mongoid::Errors::DocumentNotFound
    rescue_from ActionController::ParameterMissing, with: :render_400

    def render_400(errors = 'required parameters invalid')
      render_errors(errors, 400)
    end

    def render_401(errors = 'unauthorized access')
      render_errors(errors, 401)
    end

    def render_404(errors = 'not found')
      render_errors(errors, 404)
    end

    def render_422(errors = 'could not save data')
      render_errors(errors, 422)
    end

    def render_500(errors = 'internal server error')
      render_errors(errors, 500)
    end

    def render_errors(errors, status = 400)
      Rails.logger.fatal(errors.backtrace.join("\n")) if errors.try(:backtrace)

      data = {
        status: 'failed',
        errors: Array.wrap(errors)
      }

      render json: data, status: status
    end

    def render_object_errors(obj, status = 400)
      if obj.is_a?(ActiveRecord::Base) # ActiveModel::Model for Mongoid
        render_object_errors(obj.errors, status)
      elsif obj.is_a?(ActiveModel::Errors)
        render_errors(obj.full_messages, status)
      else
        render_errors(obj, status)
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end
