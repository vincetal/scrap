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

def crypto_scrapper(page)

  cryptos = []
  result = []

  page.css('td.text-left.col-symbol, a.price').each do |item|
    cryptos <<  item.text
  end

  cryptos.length.times do |variable|
    if variable.even?
      result << {"#{cryptos[variable]}" => cryptos[variable + 1]}
    end
  end
  return result
end

def perform
  page = initialize_nogiri("https://coinmarketcap.com/all/views/all/")
  puts crypto_scrapper(page)
end

perform
