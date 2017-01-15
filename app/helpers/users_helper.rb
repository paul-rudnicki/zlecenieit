module UsersHelper
	def print_value value
		if value.present?
			value
		else
			"nie podano"
		end
	end

	def print_verfiy verify
		if verify
			"Tak"
		else
			"Nie"
		end
	end
end
