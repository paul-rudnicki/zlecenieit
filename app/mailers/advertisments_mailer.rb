class AdvertismentsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.advertisments_mailer.new_adverstisment_notify.subject
  #
  def new_adverstisment_notify(title)
    @title = title

    mail to: "pawelrudnicki79@gmail.com",
    			subject: 'Dodano nowe zlecenie',
    			from: 'Zlecenieit <noreplay@zlecenieit.herokuapp.com>'
  end
end
