class Restaurant < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 5}
	validates :pricerange, :address, :cuisine, :summary, :capacity, :menu, presence: true

	has_many :reservations

	def available(party_size,party_time)
		booking=0
		reservations = Reservation.where(@restaurant = @restaurant_id)
		reservations.each do |r|
			booking += r.party_size
		end

		if booking + party_size > @restaurant.capacity.to_i
			return nil
		else
			return true
		end

	end

end
