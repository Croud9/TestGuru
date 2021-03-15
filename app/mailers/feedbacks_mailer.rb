class FeedbacksMailer < ApplicationMailer

  def feedback(feedback)
    @user = feedback.user
    @feedback = feedback

    mail(to: @user.email, subject: " 'TestGuru App': Feedback from #{@feedback.user.email}", body: 'something')
    #mail to: @admin.email, subject: " 'TestGuru App': Feedback from #{@feedback.user.email}"
  end
end
