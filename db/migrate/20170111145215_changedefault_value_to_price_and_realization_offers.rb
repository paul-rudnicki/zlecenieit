class ChangedefaultValueToPriceAndRealizationOffers < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :offers, :price, "do negocjacji"
  	change_column_default :offers, :realization, "do negocjacji"
  end
end
