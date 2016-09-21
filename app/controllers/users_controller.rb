class UsersController < ApplicationController
  before_action :set_user, only: [:show, :favorites]

  def index
    @users = User.all
  end

  def show
    @tweets = @user.tweets.order("created_at DESC")
  end

  def favorites
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
