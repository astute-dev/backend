class User < ActiveRecord::Base
	attr_accessible :username, :email, :password

	has_and_belongs_to_many :events
end
