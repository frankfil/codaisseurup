class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :text
      t.string :location
      t.string :string
      t.string :price
      t.string :decimal
      t.integer :capacity
      t.boolean :includes_food
      t.boolean :includes_drinks
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :active

      t.timestamps
    end
  end
end
