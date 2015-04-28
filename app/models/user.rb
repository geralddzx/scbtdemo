# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string           not null
#  last_name              :string           not null
#  username               :string           not null
#  number                 :string
#  role                   :string           not null
#  year                   :integer
#  month                  :integer
#  day                    :integer
#  street                 :string
#  city                   :string
#  postal_code            :string
#  phone                  :string(10)
#  referral               :string
#  photo_url              :string
#

class User < ActiveRecord::Base
	include Phone

	REFERRALS = [
		"google",
		"facebook",
	]

	ROLES = [
	  "student", 
	  "instructor",
	  "admin", 
	  "master", 
	]
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, 
		:validatable
		
	validates :first_name, :last_name, presence:true
	validates :number, uniqueness: {allow_blank: true}
	validates :username, uniqueness: true
	validates :role, inclusion: {in: ROLES}
	validates :email, email: true
	validate :validate_phone

	has_many :events, foreign_key: :author_id, dependent: :nullify
	has_many :news, foreign_key: :author_id, dependent: :nullify
	has_many :media, foreign_key: :uploader_id, dependent: :nullify


	def set_username
		return self.username = nil if self.name.nil?
		prefix = self.first_name[0] + self.last_name
		prefix = prefix.downcase
		suffix = nil
		users = User.all
		while users.find_by_username(prefix + suffix.to_s)
			suffix ||= 0
			suffix += 1
		end
		self.username = prefix + suffix.to_s
	end

	def admin?
		self.role == "admin" || self.role == "master"
	end

	def master?
		self.role == "master"
	end

	def student?
		self.role == "student"
	end

	def instructor?
		self.role == "instructor"
	end

	def name
		return nil if self.first_name.nil? || self.first_name.empty?
		return nil if self.last_name.nil? || self.last_name.empty?
		self.first_name.capitalize + " " + self.last_name.capitalize
	end

	# def downcase_name
	# 	self.first_name = self.first_name.downcase
	# 	self.last_name = self.last_name.downcase
	# end
end
