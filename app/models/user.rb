# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  type                   :string(255)
#

class User < ActiveRecord::Base
  devise :omniauthable, :rememberable, :trackable

  has_many :authentications, dependent: :destroy
  has_one :meetup_authentication, -> { where(provider: 'meetup') },
    class_name: 'Authentication'

  has_attached_file :service_avatar

  def to_s
    name
  end
end
