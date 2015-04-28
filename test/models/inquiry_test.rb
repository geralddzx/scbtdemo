# == Schema Information
#
# Table name: inquiries
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  phone           :string
#  subject         :string
#  ip_address      :string
#  read            :boolean          default(FALSE)
#  http_user_agent :string
#  campus_id       :integer
#  program_id      :integer
#  referral        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class InquiryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
