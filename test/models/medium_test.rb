# == Schema Information
#
# Table name: media
#
#  id          :integer          not null, primary key
#  url         :string           not null
#  mimetype    :string
#  filename    :string           not null
#  uploader_id :integer
#  size        :integer
#  source_id   :integer
#  source_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
