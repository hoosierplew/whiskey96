# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  whiskey_id :integer
#  person_id  :integer
#  nose       :integer
#  taste      :integer
#  finish     :integer
#  balance    :integer
#  review     :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class RatingsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
