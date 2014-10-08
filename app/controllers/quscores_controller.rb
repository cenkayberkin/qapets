class QuscoresController < ApplicationController
  def change_vote
    if current_user.nil?
      render json: { result: "Please login first" , status: "2" }
    else
      question_id = params[:question_id]
      vote = params[:vote] == "up"?  1 : -1

      qs = QuestionScoreService.new({question_id: question_id, vote: vote, user_id: current_user.id})
      result = qs.update()

      render json: { result: result , status: "1" }
    end
  end
end
