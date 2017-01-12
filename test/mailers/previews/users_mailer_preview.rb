# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/users_mailer/new_user_notification
  def new_user_notification
    UsersMailer.new_user_notification(User.new(email: 'monika@gmail.com', password: 'monika'))
  end

  def reset_password_notify
  	UsersMailer.reset_password_notify()
  end

  def generate_password_notify
  	UsersMailer.generate_password_notify()
  end

  def generate_confirmation_notify()
  	UsersMailer.generate_confirmation_notify()
  end
end
