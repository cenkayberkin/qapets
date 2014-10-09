class AnscoresController < ApplicationController
  def change_vote
    if current_user.nil?
      render json: { result: "Please login first" , status: "2" }
    else
      answer_id = params[:answer_id]
      vote = params[:vote] == "up"?  1 : -1

      qs = AnswerScoreService.new({answer_id: answer_id, vote: vote, user_id: current_user.id})
      result = qs.update()

      render json: { result: result , status: "1" }
    end
  end
end
