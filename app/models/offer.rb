class Offer < ApplicationRecord
  belongs_to :advertisment
  belongs_to :user

  validates :content, presence: true

  before_save :set_default_price_and_realization

  def set_default_price_and_realization
  	if ! price.present?
			self.price = 'do negocjacji'  		
  	end
  	if ! realization.present?
			self.realization = 'do negocjacji'  		
  	end
  end

end
