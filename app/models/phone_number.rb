class PhoneNumber < ApplicationRecord
  belongs_to :customer
  belongs_to :area_code
end
