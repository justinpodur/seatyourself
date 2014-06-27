require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	let(:restaurant) { Restaurant.new(name: 'canoe', capacity: 100) }

  it 'returns true when party size is less than capacity' do
  	expect(restaurant.availability(25)).to be true
  end

  it 'returns false when party size is over the capacity' do
  	expect(restaurant.availability(101)).to be false
  end

  it 'should return false when reservations plus party size dont fit' do
  	res = Reservation.create(restaurant: restaurant, party_size: 10)
  	expect(restaurant.availability(91)).to be false
  end

  it 'should return true when restaurant empty at 7pm' do
  	party_time = DateTime.new(2014,4,17,18,00)
  	res = Reservation.create(
  		restaurant: restaurant,
  		party_size: 100,
  		party_time: party_time
  		)
  	t = DateTime.new(2014,4,17,18,00)
		expect(restaurant.availability(10,t)).to be true
	end

end