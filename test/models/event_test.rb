# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  datetime   :datetime
#  location   :string
#  content    :text
#  author_id  :integer
#  display    :boolean          default(TRUE), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
