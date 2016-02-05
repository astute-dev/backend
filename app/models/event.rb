class Event < ActiveRecord::Base
  belongs_to :user

  def organizer
  	return User.find(self.user_id).username
  end
  
  has_and_belongs_to_many :users
end
