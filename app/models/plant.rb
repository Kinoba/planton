# == Schema Information
#
# Table name: plants
#
#  created_at       :datetime         not null
#  id               :bigint           not null, primary key
#  name             :string
#  needs_processing :boolean
#  picture_reminder :integer
#  public           :boolean
#  start_date       :date
#  updated_at       :datetime         not null
#  user_id          :bigint
#  water_reminder   :integer
#

# A plant
class Plant < ApplicationRecord
  belongs_to :user

  has_many_attached :pictures

  validates :name, :public, :start_date, :picture_reminder, presence: true
end
