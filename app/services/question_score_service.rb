class QuestionScoreService
  def initialize(options = {})
    @question_id = options[:question_id]
    @point = options[:vote]
    @user = options[:user_id]
  end

  def update()

    # this case is for if question score incresed by one.
    question_scores = Quscore.where("user_id = :user_id AND question_id = :question_id",
                                  {user_id: @user , question_id: @question_id})
    newPoint = @point
    oldPoint = question_scores.first.point if !question_scores.empty?

    question = Question.find(@question_id)
    user = User.find(@user)

    questionOwner = question.user

    result = 0

    if question_scores.empty?
      # binding.pry
      qs = question.quscores.new(user_id: @user, point: @point)
      qs.save()

      questionOwner.point += @point
      questionOwner.save()
      result = 1
    elsif !question_scores.empty?  &&  oldPoint == 1 &&  newPoint == 1
      # dont do anything
      result = 0
    elsif !question_scores.empty?  &&  oldPoint  == 1  && newPoint == -1
      # binding.pry
      question_scores.first.point -= 1
      question_scores.first.save()

      questionOwner.point -= @point
      questionOwner.save()
      result = -1
    elsif !question_scores.empty?  &&  oldPoint == -1 && newPoint == 1
      # binding.pry
      question_scores.first.point += 1
      question_scores.first.save()

      questionOwner.point += @point
      questionOwner.save()
      result = 1
    elsif !question_scores.empty?  &&  oldPoint == -1 && newPoint == -1
      # do nothing
      # binding.pry
      result = 0
    elsif !question_scores.empty?  &&  oldPoint == 0 && newPoint == -1
      # binding.pry
      question_scores.first.point -= 1
      question_scores.first.save()

      questionOwner.point -= @point
      questionOwner.save()
      result = -1
    elsif !question_scores.empty?  &&  oldPoint == 0 && newPoint == 1
      # binding.pry
      question_scores.first.point += 1
      question_scores.first.save()

      questionOwner.point += @point
      questionOwner.save()
      result = 1
    end

    result
  end
end
