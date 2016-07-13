class User < ActiveRecord::Base 
	validates :email, uniqueness: {message: "Account already exists with that e-mail address."}, format: {with: /.+@.+\..+/, message: "Please enter a valid email address."}, presence: {message: "Please enter your email address."}
	validates :full_name, presence: {message: "Please enter your full name."}
	has_secure_password
	before_create :capitalize

	has_many :questions, foreign_key: :user_id
	has_many :answers, foreign_key: :user_id
	has_many :answer_votes, foreign_key: :user_id
	has_many :question_votes, foreign_key: :user_id
	
	def capitalize
		self.full_name = self.full_name.split.map(&:capitalize).join(' ')
	end
end