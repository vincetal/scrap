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

def get_all_congressmen_contact(page_principale)
  congressmen = []

  page_principale.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href').each do |link|
    congressmen << get_congressman_contact(link.text)
  end

  return congressmen

end


def get_congressman_contact(congressman_file)

  page = initialize_nogiri("http://www2.assemblee-nationale.fr#{congressman_file}")

  return {"first_name" => page.css('//h1')[1].text.split(" ")[1], "last_name" => page.css('//h1')[1].text.split(" ")[-1], "email" => page.css('a.email')[1].text}
end

def perform

  page_principale = initialize_nogiri("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")
  congressmen = get_all_congressmen_contact(page_principale)
  puts congressmen

end

perform
