class QuscoresController < ApplicationController
  def change_vote
    if current_user.nil?
      render json: { result: "Please login first" , status: "2" }
    else
      question_id = params[:question_id]
      vote = params[:vote] == "up"?  1 : -1
      user = current_user.id

      qs = QuestionScoreService.new({question_id: question_id, vote: vote, user_id: current_user.id})
      qs.update()

      question = Question.find(question_id)
      qs = question.quscores.new(user:current_user, point: vote)
      qs.save();

      render json: { result: vote , status: "1" }

    end
  end
end
