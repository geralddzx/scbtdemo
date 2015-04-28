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

class Inquiry < ActiveRecord::Base
	include Phone

	belongs_to :program
	belongs_to :campus
	
	validates :email, email: true, allow_blank: true
	validates :read, inclusion: {in: [true, false]}
	validate :validate_phone
	validate :validate_contact
	validates :campus, :existence => { :allow_nil => true, :both => false }
	validates :program, :existence => { :allow_nil => true, :both => false }

	def validate_contact
		if self.email.blank? && self.phone.blank?
	    	errors.add(:base, "You must provide email or phone.")
	    end
	end
end
