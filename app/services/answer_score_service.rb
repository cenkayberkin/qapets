class AnswerScoreService
  def initialize(options = {})
    @answer_id = options[:answer_id]
    @point = options[:vote]
    @user = options[:user_id]
  end

  def update()
    answer_scores = Anscore.where("user_id = :user_id AND answer_id = :answer_id",
                                  { user_id: @user , answer_id: @answer_id })
    newPoint = @point
    oldPoint = answer_scores.first.point if !answer_scores.empty?

    answer = Answer.find(@answer_id)
    user = User.find(@user)

    answerOwner = answer.user

    result = 0

    if answer_scores.empty?
      # binding.pry
      qa = answer.anscores.new(user_id: @user, point: @point)
      qa.save()

      answerOwner.point += @point
      answerOwner.save()
      result = 1
    elsif !answer_scores.empty?  &&  oldPoint == 1 &&  newPoint == 1
      # dont do anything
      result = 0
    elsif !answer_scores.empty?  &&  oldPoint  == 1  && newPoint == -1
      # binding.pry
      answer_scores.first.point -= 1
      answer_scores.first.save()

      answerOwner.point += @point
      answerOwner.save()
      result = -1
    elsif !answer_scores.empty?  &&  oldPoint == -1 && newPoint == 1
      # binding.pry
      answer_scores.first.point += 1
      answer_scores.first.save()

      answerOwner.point += @point
      answerOwner.save()
      result = 1
    elsif !answer_scores.empty?  &&  oldPoint == -1 && newPoint == -1
      # do nothing
      # binding.pry
      result = 0
    elsif !answer_scores.empty?  &&  oldPoint == 0 && newPoint == -1
      # binding.pry
      answer_scores.first.point -= 1
      answer_scores.first.save()

      answerOwner.point += @point
      answerOwner.save()
      result = -1
    elsif !answer_scores.empty?  &&  oldPoint == 0 && newPoint == 1
      # binding.pry
      answer_scores.first.point += 1
      answer_scores.first.save()

      answerOwner.point += @point
      answerOwner.save()
      result = 1
    end

    result
  end
end
