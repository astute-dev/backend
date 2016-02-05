class User < ActiveRecord::Base
	attr_accessible :username, :email, :password

	has_many :events_users
	has_many :events, :through => :events_users
end
