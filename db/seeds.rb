require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.delete_all
File.open("#{Rails.root}/public/seed_data/seed_events_DTG.csv") do |row|
	row.read.each_line do |line|
		title, venue, street_number, street_name, city, state, zip, description, cost, tickets, url, image, category, date, time = line.chomp.split(";")
		Event.create!(:title => title, :venue => venue, :street_number => street_number, :street_name => street_name, :city => city, :state => state, :zip => zip, :description => description, :cost => cost, :tickets => tickets, :url => url, :image => image, :category => category, :date => date, :time => time)
	end
end

