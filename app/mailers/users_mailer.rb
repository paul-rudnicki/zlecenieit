class UsersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.users_mailer.new_user_notification.subject
  #
  def new_user_notification(user)
    @user = user

    mail to: "pawelrudnicki79@gmail.com", subject: 'Nowy użytkownik', from: 'Zlecenieit <info@zlecenieit.pl>'
  end

  def generate_confirmation_notify(email, confirmation)
  	@confirmation = confirmation

  	mail to: email, 
  			subject: "Potwierdzenie generowanie nowego hasła", 
  			from: "Zlecenieit <info@zlecenie.pl>"
  end


  # def reset_password_notify(email, password)
  # 	@password = password

  # 	# mail to: email, subject
  # end

  def send_new_password(email, password)
		  @password = password

		  mail to: email,
		  			subject: 'Nowo wygenerowane hasło do Zlecenieit',
		  			from: 'Zlecenieit <info@zlecenieit.pl>' 
  end


end
