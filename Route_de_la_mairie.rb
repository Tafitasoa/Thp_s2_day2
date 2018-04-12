require 'open-uri'
require 'nokogiri'


def get_the_email_of_a_townhal_from_its_webpage(page_url)
    doc = Nokogiri::HTML(open(page_url))
    puts doc.css('.tr-last')[3].text.split(" ")[2]
end
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

def get_all_the_urls_of_val_doise_townhalls(page_url)
    doc_2 = Nokogiri::HTML(open(page_url))

    city = Hash.new(0)
    
    doc_2.css('.lientxt').each_with_object(city) do |town, mail|
        town_name = town.text
        link = "http://annuaire-des-mairies.com" + town['href'][1..-1]
        email = get_the_email_of_a_townhal_from_its_webpage(link)
    end
end
get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

