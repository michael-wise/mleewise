class TechinmiamiController < ApplicationController
  def newevent
  	event = Event.new(event_params)
	# puts getIDfromURL(event.eventURL)
	eventBriteJSON = getEventBrite(event.eventURL)
	puts JSON.parse(eventBriteJSON)["name"]["text"]
  	if event.save
  		redirect_to 'techinmiami/events'
  	else
  		render text: 'failure'
  	end
  end
  def getEventBrite(event)
  	#construct api uri
  	uri = 'https://www.eventbriteapi.com/v3/events/' + getIDfromURL(event) + "?token=AX32C6AVKQ3FAXNYENO6"
  	require 'open-uri'
  	response = open(uri).read
  	eventBriteJSON = JSON.parse(response)
  	return eventBriteJSON
  end
  def getIDfromURL(url)
  	dat = /(?:.+)(?:-)(\d{6,})/.match(url)
  	return dat[-1]
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
