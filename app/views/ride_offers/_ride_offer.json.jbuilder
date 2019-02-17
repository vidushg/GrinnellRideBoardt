json.extract! ride_offer, :id, :username, :origin, :destination, :rideDate, :rideTime, :moneyRequested, :comments, :created_at, :updated_at
json.url ride_offer_url(ride_offer, format: :json)
