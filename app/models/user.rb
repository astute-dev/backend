class User < ActiveRecord::Base
	attr_accessible :username, :email, :password

	has_many :events
end
