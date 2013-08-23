require 'nokogiri'
require 'open-uri'

def get_news
	
	google = Nokogiri::HTML(open('https://news.google.ca'))

	news_stories = format_news(google)

	news_stories
end

def format_news(parsed_web_page)

	stories = []
	10.times do |count|
		stories << parsed_web_page.css("span.titletext")[count].text
	end

	return stories
end

def engadget_news
	
end

