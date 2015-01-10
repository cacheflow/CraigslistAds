require "rake"
require "csv"

task default: %w[removeWhiteSpace]

task :removeWhiteSpace do 
	file = Rake::FileList.new("*/removeWhiteSpace.rb")
	ruby file 
end 