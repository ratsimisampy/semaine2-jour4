require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

@debut_url = "http://annuaire-des-mairies.com/"
@url_departement = "http://annuaire-des-mairies.com/val-d-oise.html"
@cities = Array.new
@emails = Array.new
def get_mail(my_url)
  my_path = "/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]"   
  page = Nokogiri::HTML(open(my_url))   
  page.xpath(my_path)
end

def get_urls(my_url)
  #recupere toutes les villes dans un tableau
  page = Nokogiri::HTML(open(my_url))
  news_links = page.css("a").select{|link| link['class'] == "lientxt"}
  
  #binding.pry
  #Puis pour chaque element du tableau recuperer l'lement href
  @array_of_urls = news_links.each{|link| 
    @emails << get_mail(link['href'].gsub("./",@debut_url) )
  	@cities << link.text
  }	
  get_cities_and_mails(@cities, @emails)
  #binding.pry
end
#=========BONUS===============
def get_cities_and_mails(array_of_cities,array_of_mails)
  puts array_of_cities.zip(array_of_mails)
end
#=========FIN BONUS===============
get_urls(@url_departement)
