class UserMailer < ApplicationMailer
  def registration(user)
    @user = user
    mail(to: @user.email, subject: '電源マップへようこそ！')
  end
end
