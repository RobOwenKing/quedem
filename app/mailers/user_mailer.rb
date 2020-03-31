class UserMailer < ApplicationMailer
  helper AttendanceHelper
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.vote_casted.subject
  #
  def vote_casted
    @user = params[:user] # Instance variable => available in view
    @hangout = params[:hangout]
    @voter = params[:voter]
    mail(to: @user.email, subject: "Vote has been casted for #{@hangout.name}")
    # This will render a view in `app/views/user_mailer`!
  end
end

