class QuscoresController < ApplicationController
  # before_action :authenticate_user!, only: [change_vote]

  def change_vote
    question_id = params[:question_id]
    vote = params[:vote] == "up"?  1 : -1
    user = current_user.id

    question = Question.find(question_id)

    qs = question.quscores.new(user:current_user, point: vote)
    qs.save();

    render json: { result: vote}
  end
end
