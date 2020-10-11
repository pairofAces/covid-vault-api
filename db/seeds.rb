# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'rest-client'

url = ENV["api_url"]

count = 0
while count < 216 do

    # case count
    # when 1
    #     puts " "
    #     puts "Beginning to seed data...please be patient...🌱"
    #     puts " "
    # when 50
    #     puts "Just getting started...🍀"
    #     puts " "
    # when 100
    #     puts "25% complete 🌿"
    #     puts " "
    # when 150
    #     puts "50% complete 🌵"
    #     puts " "
    # when 200
    #     puts "Yes, still seeding...but growing 🌴"
    #     puts " "
    # when 250
    #     puts "95% complete 🌳"
    #     puts " "
    # end

    # begin
        country_data = JSON.parse(RestClient.get("https://disease.sh/v3/covid-19/countries?yesterday=true&twoDaysAgo=false&allowNull=true"))

        name = country_data[count]["country"]
        active = country_data[count]["active"].to_f
        recovered = country_data[count]["recovered"].to_f
        deaths = country_data[count]["deaths"].to_f
        total = (active + recovered + deaths).to_f
        # binding.pry

        Area.create(
            name: name,
            active_cases: active,
            recovered_cases: recovered,
            deaths: deaths,
            total_cases: total
        )
        count += 1

        
        
    # rescue RestClient::ExceptionWithResponse => e
    #     e.response
    #     count += 1
    # end
end

binding.pry

