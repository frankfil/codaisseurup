class User < ApplicationRecord
  has_secure_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, dependent: :destroy

  has_many :registrations, dependent: :destroy
  has_many :registered_events, through: :registrations, source: :event

  has_one :profile

  def has_profile?
    profile.present? && profile.persisted?
  end

  def full_name
    return profile.full_name if has_profile?
    email
  end
end
