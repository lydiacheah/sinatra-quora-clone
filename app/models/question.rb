class Question < ActiveRecord::Base
	validates :title, uniqueness: {case_sensitive: false}
	
	has_many :answers, foreign_key: :question_id
	has_many :question_votes, foreign_key: :question_id
	belongs_to :user

	before_save :remove_question_mark_and_space

	def remove_question_mark_and_space
		if self.title[-1] == " "
			self.title.chomp!(' ')
		end

		if self.title.include?('?')
			self.title.delete!('?')
		end
	end
end
