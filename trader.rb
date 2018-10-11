require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

@my_page = "https://coinmarketcap.com/all/views/all/"
@currencies = Array.new
@amounts = Array.new


def get_urls(my_url)
  page = Nokogiri::HTML(open(my_url))
  page.css("a[class = 'currency-name-container link-secondary']").each { |currency| @currencies << currency.text }
  page.css("a[class = 'price']").each{ |link| @amounts << link['data-usd'].to_f }
  puts @currencies.zip(@amounts).to_h
 #binding.pry
  
end

get_urls("https://coinmarketcap.com/all/views/all/")
