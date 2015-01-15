require "mechanize"

agent = Mechanize.new
page = agent.get("http://austin.craigslist.org/search/sss?query=carpet&s=900&sort=rel")

links = page.links_with(:class => "button next")

  links.each do |li|
    next_links = agent.get(li.uri)
   track_links = next_links.links_with(:class => "hdrlnk").count
   puts "There are approxmiately #{track_links} here on the last page"
  end

check_page =  agent.get("http://austin.craigslist.org/search/sss?query=carpet&s=800&sort=rel")

test_links = check_page.links_with(:class => "button next")

test_links.each do |test_me|
  get_links = agent.get(test_me.uri)
  num = get_links.links_with(:class => "hdrlnk").count
  puts "There are approxmiately #{num} links on the page before last"
end
