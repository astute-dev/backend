class Event < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :events_users
end
