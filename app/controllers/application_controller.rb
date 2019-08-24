# Main controller
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include JSONErrors
end
