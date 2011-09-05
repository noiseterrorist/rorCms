class Notifier < ActionMailer::Base
  default from: "admin@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.confirm_email.subject
  #
  def confirm_email(user)
    @user = user

    mail :to => user.email, :subject => 'Email Confirmation'
  end
end
