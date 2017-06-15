class EventsController < ApplicationController
	def create
		@event = Event.new(event_params)
		
		if @event.save
        redirect_to story_path(@event.story.id)
      else
        format.html { render :new }
      end
	end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:type_of_event, :what, :why, :when, :where, :mode_of_transport, :flight_num, :flight_time, :flight_date, :accomodation_type, :accomodation_address, :accomodation_checkin, :accomodation_checkout, :story_id, {photo: []})
    end
end

