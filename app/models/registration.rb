class Registration < ApplicationRecord
  before_create :update_price

  belongs_to :user
  belongs_to :event

  def update_price
    
  end
end
