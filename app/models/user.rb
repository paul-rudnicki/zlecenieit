class User < ApplicationRecord

	has_many :advertisments
	has_many :offers

	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
