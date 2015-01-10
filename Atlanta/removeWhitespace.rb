require "csv"

csv_file = File.read("craigslistCleaningJobsATL.csv")

csv = CSV.parse(csv_file)

csv.each do |row|
	row.collect.strip
end 