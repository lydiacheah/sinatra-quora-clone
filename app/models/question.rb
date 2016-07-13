class Question < ActiveRecord::Base
	validates :title, uniqueness: {case_sensitive: false}
	
	has_many :answers, foreign_key: :question_id
	has_many :question_votes, foreign_key: :question_id
	belongs_to :user

	before_save :remove_question_mark

	def remove_question_mark
		if self.title[-1] == '?'
			self.title.chomp!('?')
		end
	end
end
