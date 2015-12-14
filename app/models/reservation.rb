class Reservation < ActiveRecord::Base
  validates :reserved_at, presence: true
end
