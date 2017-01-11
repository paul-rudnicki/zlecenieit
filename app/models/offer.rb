class Offer < ApplicationRecord
  belongs_to :advertisment
  belongs_to :user

  validates :content, presence: true
end
