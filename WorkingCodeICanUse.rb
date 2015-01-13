require "mechanize"
require "csv"

class Miami 

	def sale_scraper(search) 
		agent = Mechanize.new 
		page = agent.get("http://miami.craigslist.org")
		form = page.form_with(:action => "/search/")	
		form.field_with(:value => "").value = search
		agent.submit(form)
		search_results = []
			current_page = agent.uri 
			current_page.links.each do |links| 
			attributes = links.attributes.attributes["class"]
			search_results << links if attributes && attributes.value == "hdrlnk"
			end 
                                              
		CSV.open("craigslistTesting.csv", "wb") do |csv| 
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
			puts "I'm done"
		end                                                                                         

	end 

end
	miami = Miami.new
	miami.sale_scraper("nike") 

# miami_forms.field_with(:value => "").value = "laptops"
# ##We're assigning the field require
# submit = agent.submit(miami_forms)

# pp submit 


# Now I need to find a way to do multiple searches through multiple categories