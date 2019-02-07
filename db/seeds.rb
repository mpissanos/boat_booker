# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email



      20.times do
        User.create(
          name: Faker::Name.name,
          email: Faker::Internet.free_email
        )
      end

      10.times do
        Trip.create(
          start_time: Faker::Time.forward(23, :morning),
          end_time: Faker::Time.forward(23, :evening),
          location: Faker::TwinPeaks.location,
          # trip_length: ,
          boat_type: Faker::Vehicle.model,
          price: 100,
          passengers: 10

        )
      end