class User < ActiveRecord::Base
  validates :uid, presence: true

  has_many :reservations, foreign_key: :guest_id
  has_many :rooms, foreign_key: :owner_id
end
