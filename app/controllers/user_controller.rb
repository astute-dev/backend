class UserController < ApplicationController

  def index
    render json: User.all
  end

  def create
    binding.pry
    user = User.new filtered_params
    binding.pry
    user.save!
    binding.pry
    render json: user
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(filtered_params)
      render json: user
    else
      head :error
    end
  end

  def destroy
    # can only delete users owned by current user
    user = User.find(params[:id])

    if user.nil?
      # todo: different error code?
      head :error
    else
      user.destroy
      render json: user
    end
  end

  def events
    render json: current_user.events
  end

  private
    def filtered_params
      params.permit(:id, :faculty, :email, :username, :password)
    end

    def current_user
      User.find(params[:user_id])
    end

end
