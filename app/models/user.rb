# frozen_string_literal: true

# User
class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  has_many :plants, dependent: :destroy
end
