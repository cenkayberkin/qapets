class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :Anscores
  has_many :scored_users,through: :Anscore, class_name: "User"

end
