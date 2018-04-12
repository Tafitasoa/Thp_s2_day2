require 'open-uri'
require 'nokogiri'

# on vas commnecé par définir la méthode qui récupère les données
def get_all_cryptomonnnaies(page_url)
    doc = Nokogiri::HTML(open(page_url))
    
    tableau = []          # Tableau dans laquelle on vas placé les donnéés récupérés
    element_tableau = doc.css("#currencies-all tbody tr")  # On récupère les éléments du tableau
    for i in 0...element_tableau.length do                 # Et on les range bien sagement avec le boucle suivant
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        tableau.push({
            :name => x[2],
            :symbol => x[3],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        })
        puts tableau
    end
    
    tableau #c'est important de retourner les éléments dans le tableau

end

puts "###############  Soit patient en attendant l'execution du code! ;)  ############################"

# boucle par heure :) soit patient en attendant l'execution du code
# Le bonnus ;)
while 0==0
  puts get_all_cryptomonnnaies("https://coinmarketcap.com/all/views/all/")
  sleep 3600
end
