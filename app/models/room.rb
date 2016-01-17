class Room < ActiveRecord::Base
  COUNTRIES = [
    %w(Japan JP)
  ].freeze

  validates *%i(country zipcode address name), presence: true

  has_many :faq
  has_many :reservations
  belongs_to :owner, class_name: User, foreign_key: :owner_id
end
