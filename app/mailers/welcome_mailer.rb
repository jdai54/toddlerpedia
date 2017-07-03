class WelcomeMailer < ApplicationMailer
  default from: "jdai54@gmail.com"

  def new_user(user)
    @user = user

    mail(to: user.email, subject: "Welcome to Toddlerpedia!")
  end
end
