module EventsHelper

  def is_event_host(event)
    if current_user.id == event.host.id
      return true
    else return false
    end
  end
end
