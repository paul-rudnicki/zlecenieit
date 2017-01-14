# Preview all emails at http://localhost:3000/rails/mailers/advertisments_mailer
class AdvertismentsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/advertisments_mailer/new_adverstisment_notify
  def new_adverstisment_notify('coto jest')
    AdvertismentsMailer.new_adverstisment_notify
  end

end
