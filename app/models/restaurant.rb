class Restaurant < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 5}
	validates :pricerange, :address, :cuisine, :summary, :capacity, :menu, presence: true

	has_many :reservations
end
