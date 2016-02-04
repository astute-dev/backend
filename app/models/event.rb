class Event < ActiveRecord::Base
  belongs_to :user

  def organizer
  	return User.find(self.user_id).username
  end
  
end
