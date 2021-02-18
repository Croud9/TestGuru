class UserTestsController < ApplicationController
  before_action :set_passage_test, only: %i[show update result]

  def show
  end

  def update
    @passage_test.accept!(params[:answer_ids])

    if @passage_test.completed?
      TestsMailer.completed_test(@passage_test).deliver_now
      redirect_to result_user_test_path(@passage_test)
    else
      render :show
    end
  end

  def result
  end

  private

  def set_passage_test
    @passage_test = UserTest.find(params[:id])
  end

end
