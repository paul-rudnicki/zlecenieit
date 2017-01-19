namespace :zlecenieit do

	desc 'Closing advertisments'
	task :advertisments_closing => :environment do
		puts 'Start - advertisments_closing'
		advertisments = Advertisment.where(status: true, winner: nil)
		if advertisments.any?
			advertisments.each do |advertisment| 
				if Date.today > advertisment.ended_date
					advertisment.closed = true
					advertisment.winner = 0
					advertisment.save
					puts '.'
				end
			end
		end
		puts 'End - advertisments_closing'
	end

end