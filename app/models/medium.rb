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

class Medium < ActiveRecord::Base
	belongs_to :source, polymorphic: true
	belongs_to :uploader, class_name: "User"
	delegate :name, to: :uploader, prefix: true, allow_nil: true

	validates :url, :filename, presence: true
	validates :uploader, :existence => {:allow_nil => true, :both => false}
	# validates :slider, inclusion: [true, false]
end
