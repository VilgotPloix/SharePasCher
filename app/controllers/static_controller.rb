class StaticController < ApplicationController

	def index
		@events = Event.last(4)
	end


end
