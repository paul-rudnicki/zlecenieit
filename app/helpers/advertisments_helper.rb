module AdvertismentsHelper
	def to_end advertisment
		days = ((advertisment.ended_date - DateTime.now).to_i)/86000
		if days == 0
			"#{days} dni"
		elsif days == 1
			"ostatni dzień"
		elsif days > 1
			"#{days} dni"
		end
	end
end
