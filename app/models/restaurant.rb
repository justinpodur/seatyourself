class Restaurant < ActiveRecord::Base

	#belongs_to :category - not actually being used

	has_many :reservations
	has_many :users, :through => :reservations

	belongs_to :owner, :class_name => "User"

	validates :name, presence: true, length: {minimum: 5}
	# validates :pricerange, :address, :cuisine, :summary, :capacity, :menu, presence: true

	def availability(party_size,party_time = Time.now)
		reserve_size = reservations.where(party_time: party_time).sum(:party_size)
		reserve_size + party_size <= capacity.to_i
	end

	# def availability(party_size, party_time)
	# 	reserve_size = reservations.where.(party_time: party_time).sum(:party_size)
	# 	reserve_size + party_size <= capacity
	# end

end
