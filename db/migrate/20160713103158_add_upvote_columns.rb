class AddUpvoteColumns < ActiveRecord::Migration
	def change
		add_column :question_votes, :upvote, :boolean
		add_column :answer_votes, :upvote, :boolean
	end
end
