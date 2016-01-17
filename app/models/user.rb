class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :confirmable,

  has_many :reservations, foreign_key: :guest_id
  has_many :rooms, foreign_key: :owner_id

  ADMIN_IDS = [1].freeze

  def owner?
    owner
  end

  def admin?
    ADMIN_IDS.include? id
  end

  def can_edit?(resource)
    return true if admin?

    case resource
    when Room
      resource.owner == self
    else
      false
    end
  end
end
