require_relative '../lib/mairie_christmas'

describe "the get_townhall_urls method" do
  it "should return a tab of hashes" do
    expect(get_townhall_urls(["avernes","cergy"])).not_to be_nil
  end
end
