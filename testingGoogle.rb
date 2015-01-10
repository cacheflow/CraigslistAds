require "rubygems"
require "mechanize"

agent = Mechanize.new 

page = agent.get("http://miami.craigslist.org")

miami_forms = page.form_with(:action => "/search/")

miami_forms.field_with(:value => "").value = "laptops"

submit = agent.submit(miami_forms)

pp submit 