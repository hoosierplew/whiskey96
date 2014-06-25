# == Schema Information
#
# Table name: whiskeys
#
#  id           :integer          not null, primary key
#  whiskey_type :string(255)
#  tags         :string(255)
#  distillery   :string(255)
#  name         :string(255)
#  description  :text
#  image        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Whiskey < ActiveRecord::Base
end
