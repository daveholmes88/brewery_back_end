# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'open-uri'
require 'json'
states = [ "Alaska", 
                "Alabama", 
                "Arkansas",  
                "Arizona", 
                "California", 
                "Colorado", 
                "Connecticut", "Delaware", 
                "Florida", 
                "Georgia",  
                "Hawaii", 
                "Iowa", 
                "Idaho", 
                "Illinois", 
                "Indiana", 
                "Kansas", 
                "Kentucky", 
                "Louisiana", 
                "Massachusetts", 
                "Maryland", 
                "Maine", 
                "Michigan", 
                "Minnesota", 
                "Missouri", 
                "Mississippi", 
                "Montana", 
                "North Carolina", 
                "North Dakota", 
                "Nebraska", 
                "New Hampshire", 
                "New Jersey", 
                "New Mexico", 
                "Nevada", 
                "New York", 
                "Ohio", 
                "Oklahoma", 
                "Oregon", 
                "Pennsylvania", 
                "Rhode Island", 
                "South Carolina", 
                "South Dakota", 
                "Tennessee", 
                "Texas", 
                "Utah", 
                "Virginia", 
                "Virgin Islands", 
                "Vermont", 
                "Washington", 
                "Wisconsin", 
                "West Virginia", 
                "Wyoming"]
states.each do |state|
    url = "https://api.openbrewerydb.org/breweries?by_state=#{state}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response_array = JSON.parse(response.body)
    response_array.map do |brewery|
        Brewery.create(name: brewery['name'], kind: brewery['brewery_type'], address: brewery['street'], city: brewery['city'], state: brewery['state'], website: brewery['website_url'])
    end 
end 

require 'faker'

1000.times do 
    Beer.create(name: Faker::Beer.name, brewery_id: Brewery.all.sample.id)
end

