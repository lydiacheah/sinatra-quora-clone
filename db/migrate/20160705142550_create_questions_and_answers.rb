class CreateQuestionsAndAnswers < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.integer :user_id, index: true, foreign_key: true
			t.string :title, null: false
			t.string :body 
		end

		create_table :answers do |t| 
			t.integer :user_id, index: true, foreign_key: true
			t.integer :question_id, index: true, foreign_key: true
			t.integer :question_id 
			t.string :answer, null: false 
		end
	end
end
