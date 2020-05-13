class RideOffer < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :origin
  validates_presence_of :destination
  validates_presence_of :rideDate
  validates_presence_of :rideTime


end
