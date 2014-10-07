class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers
  has_many :questions

  has_many :Quscores
  has_many :pointed_scores, through: :Quscore, class_name: "Question"

  has_many :Anscores
  has_many :pointed_answer_scores, through: :Anscore, class_name: "Answer"
end
