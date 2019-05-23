require_relative "../config/database.rb"
require_relative "../lib/air.rb"
require "faker"

airports = %w(LGW LHR DUB GWY BAL)

airports.each do |name|
  airport = Air::Airport.create(name: name)

  destinations = airports.reject { |port| port == name }

  rand(4..12).times {
    plane = Air::Plane.create(:airport_id => airport.id, :destination => destinations.sample)

    100.times {
      Air::Passenger.create(name: Faker::Name.name, plane_id: plane.id)
    }
  }
end
