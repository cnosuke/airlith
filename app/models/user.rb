class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable,

  has_many :reservations, foreign_key: :guest_id
  has_many :rooms, foreign_key: :owner_id

  def owner?
    owner
  end
end
