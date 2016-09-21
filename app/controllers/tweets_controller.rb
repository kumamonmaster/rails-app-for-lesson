class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweet.save
    redirect_to tweets_path, notice: "つぶやきを投稿しました"
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to user_path(current_user), notice: "つぶやきを削除しました"
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
