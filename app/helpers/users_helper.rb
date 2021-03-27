module UsersHelper
  def is_already_subscribed(user, event)
    return user.appointments.where(event_id: event).exists?
  end

end