require "mechanize"
require "nokogiri"
require "csv"

agent = Mechanize.new 

page = agent.get("http://atlanta.craigslist.org/search/sss?sort=rel&query=pinatas")

# This stands for Craigslist links 
search_results = []


	page.links.each do |links| 
		attributes = links.attributes.attributes["class"]
		search_results << links if attributes && attributes.value == "hdrlnk"
	end 

	CSV.open("craigslistPinataAdsATL.csv", "wb") do |csv| 
		search_results.each do |searches| 
			click = searches.click 
			doc  = click.parser
			doc.css(".postingtitle").each do |parse|
				csv << [parse.text].collect(&:strip)
			end 
			doc.css("#postingbody").each do |parse|
				csv << [parse.text].collect(&:strip) 
			end 	
	end 
	puts "I'm done."
	end                                                                                         