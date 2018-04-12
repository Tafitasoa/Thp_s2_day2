require 'open-uri'
require 'nokogiri'

# a - Route de la mairie
#   a1 - Méthode qui récupère l'adresse email à partir de l'url d'une mairie, voici celle de Vauréal
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    doc = Nokogiri::HTML(open(page_url))
    doc.css('.tr-last')[3].text.split(" ")[2]
end
get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

#   a2 - Méthode qui récupère toutes les url de villes du Val d'Oise.
Url_tab = []
def get_all_the_urls_of_val_doise_townhalls(page_url)
    doc = Nokogiri::HTML(open(page_url))
    doc.css('.lientxt').each do |link|
        Url_tab.push("http://annuaire-des-mairies.com" + (link['href'][1..-1]))
    end
    Url_tab
end

#   a3 - Bonnus : name => email
Le_bonnus = []
def show_name_email
    links = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
    links.each do |i|
        Le_bonnus.push({
            :name => Nokogiri::HTML(open(i)).css('main h1')[0].text.split(" ")[0],
            :email => get_the_email_of_a_townhal_from_its_webpage(i)
        })
        puts Le_bonnus
    end
end
show_name_email