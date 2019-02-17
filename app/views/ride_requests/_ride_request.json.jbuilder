json.extract! ride_request, :id, :username, :origin, :destination, :rideDate, :rideTime, :moneyOffered, :comments, :created_at, :updated_at
json.url ride_request_url(ride_request, format: :json)
