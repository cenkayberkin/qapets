class Question < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :answers
  belongs_to :user

  has_many :Quscores
  has_many :scored_users, through: :Quscore, class_name: "User"
end
