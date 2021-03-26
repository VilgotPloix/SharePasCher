class PhotosController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@event.photo.attach(params[:photo])
		redirect_to created_index_events_path
	end

end
