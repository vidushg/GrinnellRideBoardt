class CreateRideOffers < ActiveRecord::Migration
  def change
    create_table :ride_offers do |t|
      t.string :username
      t.string :origin
      t.string :destination
      t.date :rideDate
      t.time :rideTime
      t.string :moneyRequested
      t.text :comments

      t.timestamps null: false
    end
  end
end
