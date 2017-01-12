class User < ApplicationRecord

	has_many :advertisments
	has_many :offers

	has_secure_password

	validates :email, presence: { :message => 'nie może być puste' }
	validates :email,	uniqueness: { :message => 'już występuje w bazie' }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, :message => 'musi być poprawny' }

	after_create :notify_admin

	def notify_admin
		UsersMailer.new_user_notification(self).deliver
	end

	def save_confirmation
		self.confirmation = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
		self.save
	end

	def clear_confirmation
		self.confirmation = nil
		self.save
	end
end
