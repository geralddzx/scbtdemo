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

class News < ActiveRecord::Base
	include Datetime

	belongs_to :author, class_name: "User"
	delegate :name, to: :author, prefix: true, allow_nil: true
	# has_many :media, as: :source
	
	validates :title, :description, presence: true
	validates :author, :existence => { :allow_nil => true, :both => false }
end
