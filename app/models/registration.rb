class Registration < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :event

  def set_total_price
    self.price = (event.price * guests_count).to_i
  end
end
