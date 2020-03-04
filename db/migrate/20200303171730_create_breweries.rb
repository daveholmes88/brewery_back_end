class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :kind
      t.string :address
      t.string :city
      t.string :state
      t.string :website

      t.timestamps
    end
  end
end
