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

count = 1
while count < 270 do

    case count
    when 1
        puts " "
        puts "Beginning to seed data...please be patient...🌱"
        puts " "
    when 50
        puts "Just getting started...🍀"
        puts " "
    when 100
        puts "25% complete 🌿"
        puts " "
    when 150
        puts "50% complete 🌵"
        puts " "
    when 200
        puts "Yes, still seeding...but growing 🌴"
        puts " "
    when 250
        puts "95% complete 🌳"
        puts " "
    end

    begin
        country_data = JSON.parse(RestClient.get(url))
        binding.pry
        
    rescue RestClient::ExceptionWithResponse => e
        e.response
        count += 1
    end

