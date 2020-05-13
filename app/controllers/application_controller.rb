class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper   #to use send_the_email

  def send_emails
    #function to notify all requesters via email of their matches (if any)

    results = match();

    #string to store the content of the email
    emailContent = "Hi! Matches found for your ride request:\n";

    #iterate through hashmap of usernames and matches
    results.each do |key, val|

      # the offers who matched with the requester
      matchArray = results[key];

      # break from current iteration if no matches (don't trigger the email)
      #  ie no matching offers for this request yet
      if (matchArray.count == 0) then
        break;
      end

      #append match information to email content
      emailContent += "We found #{matchArray.count} match(es) for you!\n\n";

      #iterate through the offers in the match array and add content to the email

      matchArray.each do |offer|
        emailContent += "["+offer.username + "] requested $#{offer.moneyRequested} to drive to #{offer.destination} from #{offer.origin} \n Comments:" + offer.comments + "\n";
      end

      emailContent += "\n\n";


      #puts Time.now
      #puts key

      #Trigger the email with the content
      send_the_email(key+"@grinnell.edu", "New Ride Notification", emailContent);
      
      # Reset the email content object
      emailContent = ""
      return TRUE

    end

  end

  def match
    #function to return a HashMap of matches (array of offers mapped to every request)

    @requests = RideRequest.all
    @offers = RideOffer.all

    #create HashMap of requests and matches
    matchMap = Hash.new();
    #iterate through all the ride requests
    @requests.each { |req|
      # array to store the matches of every request
      matches = Array.new();
      #iterate through all the ride offers
      @offers.each { |offer|
        #add to matches array if it's a match
        if (does_match(req, offer)) then
          puts "Match found for "+ String(req.username)+" and "+offer.username
          matches.push(offer)
        end
      }

      #add to the hashmap ; key = username, value = matches array
      matchMap.store(req.username,matches)
    }

    return matchMap
  end

  def does_match(req, offer)
    # function to check if a request and an offer match

    # confirm origin and destination
    if (req.origin != offer.origin || req.destination != offer.destination) then
      return false;
    end

    #    puts req.rideDate.class

    # confirm date ranges
    req_date = (req.rideDate);
    off_date = (offer.rideDate);
    # allowing for flexibility in dates of +- 2 days
    gap = (req_date - off_date).to_i.abs;
    if (gap > 2) then
      return false
    else
      return true;
    end
  end

end
