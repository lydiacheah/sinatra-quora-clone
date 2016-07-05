class User < ActiveRecord::Base 
	validates :email, uniqueness: {message: "Account already exists with that e-mail address."}, format: {with: /.+@.+\..+/, message: "Please enter a valid email address."}, presence: true
	
	has_secure_password

	def self.check
		
	end
end