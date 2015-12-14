class Reservation < ActiveRecord::Base
  validates :reserved_at, presence: true

  belongs_to :room
  belongs_to :guest, class_name: User, foreign_key: :guest_id
end
