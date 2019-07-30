# frozen_string_literal: true

Devise.setup do |config|
  config.password_length = 10..24
end
