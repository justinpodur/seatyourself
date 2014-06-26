class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

# validates :availability

	# private
	
	# def availability
 #    if !restaurant.available?(party_size, party_time)
 #        errors.add(:base, "Restaurant is full")
 #    end
	# end


end
