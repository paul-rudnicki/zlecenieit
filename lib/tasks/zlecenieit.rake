namespace :zlecenieit do

	desc 'Closing advertisments'
	task :advertisments_closing => :environment do
		puts 'Start - advertisments_closing'
		advertisments = Advertisment.where(status: true, closed: false)
		if advertisments.any?
			advertisments.each do |advertisment| 
				if Date.today > advertisment.ended_date
					advertisment.closed = true
					advertisment.save
					puts '.'
				end
			end
		end
		puts 'End - advertisments_closing'
	end

end