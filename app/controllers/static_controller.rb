class StaticController < ApplicationController

	def index
		@events = Event.last(5)
	end

	def footer_apropos
	end

	def footer_confidentialite
	end

	def footer_cookies
	end

	def footer_reseaux
	end

end
