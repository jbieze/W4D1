class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"

    render json: User.all
  end

  def create
    # render json: params

    # user = User.new(params[:user].permit(:user_attributes_here))
    # # replace the `user_attributes_here` with the actual attribute keys
    # user.save!
    # render json: user

    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    # render json: params

    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
