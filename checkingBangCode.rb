require "benchmark"

time = Benchmark.realtime do 
	(1..1000).each do |number| 
		string = "string#{number}"
		array << string 
		innery_array = []
		(1..50).each do |inner_number| 
			inner_array << inner_number 
		end 
		array << inner_array 
		array = array.flatten 
	end 
end 
puts "Time elapsed #{time} seconds"