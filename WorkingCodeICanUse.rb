require "mechanize"
require "csv"

class Miami 

	def sale_scraper(query) 
		CSV.open("resultsForSale#{query}.csv", "w+", :write_headers => true, :headers => ["Title", "Body"]) do |csv| 

		agent = Mechanize.new 
		page = agent.get("http://chicago.craigslist.org")
		form = page.form_with(:action => "/search/")	
		form.field_with(:value => "").value = query.capitalize
		submit = agent.submit(form)
		links = submit.links 
		search_results = []
			links.each do |results| 
				attributes = results.attributes.attributes["class"]
				search_results << results if attributes && attributes.value = "hdrlnk"
			end 
			
			CSV.open("resultsForSale#{query}.csv", "wb") do |csv| 
				search_results.each do |searches| 
				clicked_links = searches.click
				pages = agent.get(clicked_links)
				parse = pages.parser 
				 
				 	parse.css(".postingtitle").each do |title|
						csv << [title.text].collect(&:strip)
					end 
					parse.css("#postingbody").each do |body|
						csv << [body.text].collect(&:strip)
					end 
					
				end 

			end 	
		# search_results = []
		# 	current_page = agent.get(URI) 
		# 	current_page.links.each do |links| 
		# 	attributes = links.attributes.attributes["class"]
		# 	search_results << links if attributes && attributes.value == "hdrlnk"
		# 	end 
		# search_results.each do |search| 
		# 	click_links = search.click 
		# 	doc  = click_links.parser 	
  #                            pp doc 
  #                       end                  
		# CSV.open("craigslistTesting.csv", "wb") do |csv| 
		# 	search_results.each do |searches| 
		# 		click = searches.click 
		# 		doc  = click.parser
		# 		doc.css(".postingtitle").each do |parse|
		# 			csv << [parse.text].collect(&:strip)
		# 		end 
		# 		doc.css("#postingbody").each do |parse|
		# 			csv << [parse.text].collect(&:strip) 
		# 		end 	
		# 	end 
		# 	puts "I'm done"
		# end                            
		puts "Done scraping #{query} in For Sale category done"                                                             

	end 

	def events_scraper(query) 
		agent = Mechanize.new 
		page = agent.get("http://chicago.craigslist.org")
		form = page.form_with(:action => "/search/")	
		form.field_with(:value => "").value = query.capitalize
		submit = agent.submit(form)
		links = submit.links 
		search_results = []
			links.each do |results| 
				attributes = results.attributes.attributes["class"]
				search_results << results if attributes && attributes.value = "hdrlnk"
			end 
			
			CSV.open("resultsForSale#{query}.csv", "wb") do |csv| 
				search_results.each do |searches| 
				clicked_links = searches.click
				pages = agent.get(clicked_links)
				parse = pages.parser 
				 
				 	parse.css(".postingtitle").each do |title|
						csv << [title.text].collect(&:strip)
					end 
					parse.css("#postingbody").each do |body|
						csv << [body.text].collect(&:strip)
					end 
					
				end 

			end 	
		# search_results = []
		# 	current_page = agent.get(URI) 
		# 	current_page.links.each do |links| 
		# 	attributes = links.attributes.attributes["class"]
		# 	search_results << links if attributes && attributes.value == "hdrlnk"
		# 	end 
		# search_results.each do |search| 
		# 	click_links = search.click 
		# 	doc  = click_links.parser 	
  #                            pp doc 
  #                       end                  
		# CSV.open("craigslistTesting.csv", "wb") do |csv| 
		# 	search_results.each do |searches| 
		# 		click = searches.click 
		# 		doc  = click.parser
		# 		doc.css(".postingtitle").each do |parse|
		# 			csv << [parse.text].collect(&:strip)
		# 		end 
		# 		doc.css("#postingbody").each do |parse|
		# 			csv << [parse.text].collect(&:strip) 
		# 		end 	
		# 	end 
		# 	puts "I'm done"
		# end                            
		puts "Done scraping #{query} in events category"                                                             

	end 

end
	miami = Miami.new
	miami.sale_scraper("horses") 


# miami_forms.field_with(:value => "").value = "laptops"
# ##We're assigning the field require
# submit = agent.submit(miami_forms)

# pp submit 


# Now I need to find a way to do multiple searches through multiple categories