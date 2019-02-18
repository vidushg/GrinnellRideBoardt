class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  def send_emails
    
    results = match();
    
       
      str = "Hi! Matches found for your ride request:\n";
      
      results.each do |key, val|

      # the people who matched with the requester
      matchArray = results[key];
      # go back if no matches
      if (matchArray.count == 0) then 
        return; 
      end

      str += "We found #{matchArray.count} match(es) for you!\n\n";

      matchArray.each do |offer| 
        str += "["+offer.username + "] requested $#{offer.moneyRequested} to drive to #{offer.destination} from #{offer.origin} \n Comments:" + offer.comments + "\n";
      end
      
      str += "\n\n";
      
      
      #puts Time.now
      #puts key
      send_the_email(key+"@grinnell.edu", "New Ride Notification", str);
      
      # Reset the string object
      str = ""
      
      #
      # stuff to do-
      #clean out the matches, 
    end
    
  end
  
  def match
    @requests = RideRequest.all
    @offers = RideOffer.all
    
    matchMap = Hash.new();
    @requests.each { |req|
      # Get matches
      matches = Array.new();
      
      @offers.each { |offer| 
        if (does_match(req, offer)) then 
          matches.push(offer)
        end
      }
      
      # Put
      matchMap.store(req.username,matches)
    }
    
    return matchMap
  end
  
  def does_match(req, offer)
    # Check
    if (req.origin != offer.origin || req.destination != offer.destination) then 
      return false; 
    end
    
    puts req.rideDate.class
    
    # Check again
    req_date = (req.rideDate);
    off_date = (offer.rideDate);
    
    gap = (req_date - off_date).to_i.abs;
    if (gap > 2) then
      return false
    else
      return true;
    end
  end
  
end
