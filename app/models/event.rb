class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy

  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  def bargain?
    price < 30
  end

  def self.order_by_name
    order :name
  end

  def self.order_by_price
    order :price
  end

  scope :published, -> { where(active: true) }

  def self.starts_before_ends_after(arrival, departure)
    where('starts_at < ? AND ends_at > ?', arrival, departure)
  end

  scope :start_during, ->(arrival, departure){
    where('starts_at > ? AND starts_at < ?', arrival, departure)
  }

  scope :ends_during, ->(arrival, departure){
    where('ends_at > ? AND ends_at < ?', arrival, departure)
  }

end
