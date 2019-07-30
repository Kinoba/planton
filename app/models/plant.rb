# A plant
class Plant < ApplicationRecord
  belongs_to :user

  validates :name, :start_date, :screenshot_reminder, presence: true
end
