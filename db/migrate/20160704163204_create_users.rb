class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :full_name
			t.string :email
			t.string :encrypted_password
		end
	end
end
