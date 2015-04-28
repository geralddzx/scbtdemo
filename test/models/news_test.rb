# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  datetime    :datetime
#  description :string
#  content     :text
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
