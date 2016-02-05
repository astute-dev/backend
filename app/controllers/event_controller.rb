class EventController < ApplicationController
  def index
    events = Event.all.to_json(:methods => [:organizer, :number_attending])
    render json: notify_attendence(events)
  end

  def create
    event = Event.new filtered_params
    event.save!
    current_user.events += [event]
    current_user.save!
    render json: event
  end

  def show
    render json: Event.find(params[:id]).to_json(:methods => [:organizer, :number_attending])
  end

  def update
    event = Event.find(params[:id])

    if event.update_attributes(filtered_params)
      render json: event
    else
      head :error
    end
  end

  def destroy
    # can only delete events owned by current user
    event = Event.find_by(id: params[:id], user_id: params[:user_id])

    if event.nil?
      # todo: different error code?
      head :error
    else
      event.destroy
      render json: event
    end
  end

  def courses
    @data = File.read("#{Rails.root}/public/course_data.json")
    render json: @data
  end

  def attend
    eu = EventsUser.where(user_id: params[:user_id], event_id: params[:event_id])
    unless eu.blank?
      user = User.find(params[:user_id])
      event = Event.find(params[:event_id])
      event.users.delete(user)
      event.save!
      render text: "You left the astute group.", status: 200
    else
      if EventsUser.new(user_id: params[:user_id], event_id: params[:event_id]).save!
        render text: "You joined the astute group!", status: 200
      else
        render text: "Something went wrong saving your attendance", status: 500
      end
    end
  end


  private
    def filtered_params
      temp = params.permit(:id, :name, :location, :description, :department, :class, :user_id, :start_t, :end_t, :faculty)
      temp[:start_t] = DateTime.parse temp[:start_t]
      temp[:end_t] = DateTime.parse temp[:end_t]
      temp
    end

    def current_user
      User.find(params[:user_id])
    end

    def notify_attendence (events)
      if params[:user_id]
        events = JSON.parse(events)
        events.each do |event|
          event["attending"] = attending?(event["id"])
        end
        events.to_json
      end
      events
    end

    def attending?(id)
      event = Event.find(id)
      event.users.find_by_id(params[:user_id]).present?
    end
end
