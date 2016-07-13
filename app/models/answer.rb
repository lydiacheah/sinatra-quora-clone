class Answer < ActiveRecord::Base
	validates :answer, presence: {message: "Answer cannot be blank."}

	belongs_to :user
	belongs_to :question
	has_many :answer_votes, foreign_key: :answer_id
end
