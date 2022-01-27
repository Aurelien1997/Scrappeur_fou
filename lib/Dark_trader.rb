require 'nokogiri'
require 'open-uri'

def scraper
    url = "https://coinmarketcap.com/all/views/all/"
    unparsed_page = URI.open(url).read
    parsed_page = Nokogiri::HTML(unparsed_page)

    name = parsed_page.css('a.cmc-table__column-name--name.cmc-link')
    name_array = name.collect(&:text) 

    price = parsed_page.css('div.cLgOOr')
    price_array = price.collect(&:text) 

    puts " "

    new_array = name_array.zip(price_array)
    print new_array
end

scraper


