require_relative '../lib/dark_trader'

describe "the crypto_scrapper method" do
  it "should return a tab of hashes" do
    expect(crypto_scrapper(Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")))).not_to be_nil
  end
end
