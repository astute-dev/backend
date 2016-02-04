class EventController < ApplicationController
  def index
    render json: Event.all
  end

  def create
    event = Event.new filtered_params
    event.save!
    current_user.events += [event]
    current_user.save!
    render json: event
  end

  def show
    render json: Event.find(params[:id])
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
end
