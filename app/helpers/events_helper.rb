module EventsHelper
	def recentEvents(num=5)
		return Event.order(eventTime: :desc).last(num)
	end
end