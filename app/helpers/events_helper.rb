module EventsHelper
	def recentEvents(num=5)
		return Event.order(eventTime: :desc).last(num)
	end
	def pageinateRecentEvents(num=5)
		return Event.where('eventTime >= ?', 1.day.ago).paginate(page: params[:page]).order('eventTime ASC')
	end
end