class TechinmiamiController < ApplicationController
  def newevent
  	event = Event.new(event_params)
  	eventInfo = JSON.parse(getEventBrite(event.eventURL))
  	event.eventURL = eventInfo["url"]
  	event.eventID = eventInfo["id"]
  	event.eventTime = eventInfo["start"]["utc"]
  	event.eventName = eventInfo["name"]["text"]
  	event.eventDescription = eventInfo["description"]["text"]
  	event.eventOrganizerID = eventInfo["organizer_id"]

  	getEventBriteOrganizer(eventInfo)
  	organizerName = eventInfo["organizer_name"]
  	event.eventOrganizerName = organizerName
  	
  	event.eventVenueID = eventInfo["venue_id"]
  	venueInfo = getEventBriteVenue(eventInfo)
  	event.eventLocation = venueInfo["address"]["localized_address_display"]
  	event.eventVenueName = venueInfo["name"]
  	#puts status = eventInfo["name"]["text"]

  	if event.save
  		redirect_to '/techinmiami/events'
  	else
  		render text: 'failure'
  	end
  end

  #takes eventBrite event JSON and returns venue
  #API gives 403 because supposedly the venue name is private.
  #returns venueInfo hash.
  def getEventBriteVenue(eventInfo)
  	venueID = eventInfo["venue_id"]
  	uri = 'https://www.eventbriteapi.com/v3/venues/' + venueID + "/?token=IBRNHMQYAO3EJIP2WNDO"
  	require 'open-uri'
  	response = open(uri).read
  	venueInfo = JSON.parse(response)
  	return venueInfo
  end

  def getEventBriteOrganizer(eventInfo)
  	organizerID = eventInfo["organizer_id"]
  	uri = 'https://www.eventbriteapi.com/v3/organizers/' + organizerID + "/?token=IBRNHMQYAO3EJIP2WNDO"
  	require 'open-uri'
  	response = open(uri).read
  	organizerInfo = JSON.parse(response)
  	return organizerInfo
  end

  #returns JSON response for event from eventbrite via input of URL.
  def getEventBrite(eventURL)
  	#construct api uri
  	uri = 'https://www.eventbriteapi.com/v3/events/' + getIDfromURL(eventURL) + "?token=IBRNHMQYAO3EJIP2WNDO"
  	require 'open-uri'
  	response = open(uri).read
  	return response
  end

  def getIDfromURL(url)
  	dat = /(?:.+)(?:-)(\d{6,})/.match(url)
  	return dat[-1]
  end

  def index
  	@events = Event.last(5)
  end

  def events
    @events = Event.all
  end

  def list
  end
  	private
	  	def event_params
	  		params.require(:event).permit(:eventURL)
		end
end
