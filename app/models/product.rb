class Product < ApplicationRecord
	has_many :bids
	has_one :order
end
