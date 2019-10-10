require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  url = 'https://coinmarketcap.com/all/views/all/'
  page = Nokogiri::HTML(open(url))
  #crypto_name_array = Array.new
  crypto_nameS = page.xpath('//td[@class="text-left col-symbol"]') # Get crypto's names
  crypto_name_array = crypto_nameS.collect(&:text) # Get just abbreviation's crypto
  crypto_priceS = page.xpath('//td/a[@class="price"]') # Get price's crypto
  crypto_price_array = crypto_priceS.collect(&:text) # Get just abbreviation's crypto
  zipped = crypto_name_array.zip(crypto_price_array) # Add price's crypto in the array's crypto_name_array
  crypto_hash = (Hash[zipped])
  puts crypto_hash # Puts the result
end

crypto_scrapper

