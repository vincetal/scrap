#Gems de Scrapping
require 'rubygems'
require 'open-uri'
require 'nokogiri'

#Pour les tests
require 'pry'

# Au cas où on a des clés d'API
require 'dotenv'
Dotenv.load('.env')

def initialize_nogiri(page_url)
  #On récupère la page des crypto
  page = Nokogiri::HTML(open(page_url))
end

def get_all_cities()
  page_principale = initialize_nogiri("http://annuaire-des-mairies.com/val-d-oise.html")

  villes = []
  page_principale.xpath('//*[@class="lientxt"]').each do |node|
  	 villes << node.text
  end
  return villes
end

def get_townhall_email(city)

  page_mairie = initialize_nogiri("http://annuaire-des-mairies.com/95/#{city}.html")

  page_mairie.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
  	 return node.text
  end

end

def get_townhall_urls() #mettre les villes et les adresses email dans un tableau

  page_principale = initialize_nogiri("http://annuaire-des-mairies.com/val-d-oise.html")

  result = []
  page_principale.xpath('//*[@class="lientxt"]').each do |city|
  	 result << { "#{city.text}" => get_townhall_email(city.text.downcase.gsub(' ','-')) }
  end

  return result

end

def perform

  puts get_townhall_urls()

end

perform
