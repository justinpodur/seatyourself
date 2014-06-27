class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

  validates :restaurant, presence: true
  validate :available

  private
	
	def available
 		if !restaurant.availability(party_size, party_time)
  			errors.add(:base, "Restaurant is full")
  	end
 	end

end
