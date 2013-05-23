class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_topics = @user.topics
  end

  def index
    @users = User.all
  end

end