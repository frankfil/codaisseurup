class ChangePriceFormatInEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :price, 'decimal USING price::numeric'
  end
end
