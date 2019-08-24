# == Schema Information
#
# Table name: users
#
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  created_at             :datetime         not null
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  id                     :bigint           not null, primary key
#  image                  :string
#  name                   :string
#  nickname               :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :text
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  updated_at             :datetime         not null
#

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :plants
end
