require 'nokogiri'
require 'open-uri'

def get_news
	
	google = Nokogiri::HTML(open('https://news.google.ca'))

	stories = format_news(google)

	stories
	


end

def format_news(parsed_web_page)

	stories = []
	10.times do |count|
		stories << parsed_web_page.css("span.titletext")[count].text
	end

	return stories
end