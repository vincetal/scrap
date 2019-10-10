require_relative '../lib/congressmen'

describe "the get_all_congressmen_contact method" do
  it "should return a tab of hashes with all congressmen infos" do
    expect(get_all_congressmen_contact(Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")))).not_to be_nil
  end
end

describe "the get_congressman_contact method" do
  it "should return a tab of hashes with all congressmen infos" do
    expect(get_congressman_contact("/deputes/fiche/OMC_PA2150")).to eq ({"first_name" => "Jean-Luc", "last_name" => "Mélenchon", "email" => "jean-luc.melenchon@assemblee-nationale.fr"})
    expect(get_congressman_contact("/deputes/fiche/OMC_PA719520")).to eq ({"first_name" => "Mickaël", "last_name" => "Nogal", "email" => "mickael.nogal@assemblee-nationale.fr"})
  end
end
