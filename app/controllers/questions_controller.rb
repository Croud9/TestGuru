class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show update edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show
  end

  def edit
  end

  def new
    @question = @test.questions.new
  end

  def index
    @questions = @test.questions
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render plain: 'Error'
    end
  end

  def destroy
    @question.destroy
    render inline: '<h1>Deleted</h1>'
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
