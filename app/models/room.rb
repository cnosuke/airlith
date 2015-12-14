class Room < ActiveRecord::Base
  validates %i(country zipcode address name) presence: true
end
