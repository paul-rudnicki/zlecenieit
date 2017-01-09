module ApplicationHelper
	def date_issue date
		"#{date.strftime('%d-%m-%Y')} r."
	end

	def advertisment_offers_count advertisment
		case advertisment.offers.count
		when 0
			"#{advertisment.offers.count} ofert"
		when 1
			"#{advertisment.offers.count} oferta"
		else
			"#{advertisment.offers.count} oferty"
		end
	end

	def user_verify user
		if user.verify
			'<a title="Użytkownik zweryfikowany" rel="tooltip" class="verified icon skin-background-color3 skin-font-color2 font-20px skin-background-hover1"><span>W</span></a>'.html_safe
		end
	end

end
