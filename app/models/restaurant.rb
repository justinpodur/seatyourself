class Restaurant < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 5}
	validates :pricerange, presence: true
	validates :address, presence: true
	validates :cuisine, presence: true
	validates :summary, presence: true
	validates :capacity, presence: true
	validates :menu, presence: true
end
