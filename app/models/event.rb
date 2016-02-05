class Event < ActiveRecord::Base
  belongs_to :user

  def organizer
  	return User.find(self.user_id).username
  end

  def number_attending
  	return EventsUser.where(event_id: self.id).length + 1
  end
  
  has_many :events_users
  has_many :users, :through => :events_users
end
