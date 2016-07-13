class CreateQuestionVotesAndAnswerVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :user_id, index: true, foreign_key: true
			t.integer :question_id, index: true, foreign_key: true
		end

		create_table :answer_votes do |t| 
			t.integer :user_id, index: true, foreign_key: true
			t.integer :answer_id, index: true, foreign_key: true
		end
	end
end
