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

class Event < ActiveRecord::Base
	include Datetime

	belongs_to :author, class_name: "User"
	delegate :name, to: :author, prefix: true, allow_nil: true
	
	validates :title, presence: true
	validates :display, inclusion: [true, false]
	validates :author, :existence => { :allow_nil => true, :both => false }
end
