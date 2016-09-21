class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		@tweet = Tweet.find(params[:tweet_id])
		@favorite = current_user.favorites.build(tweet: @tweet)

		if @favorite.save
			redirect_to favorites_user_path(current_user), notice: "お気に入りに登録しました"
		else
			redirect_to tweets_path, alert: "この投稿はお気に入り登録できません"
		end
	end

	def destroy
		@favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
		@favorite.destroy
		redirect_to favorites_user_path(current_user), notice: "お気に入りを解除しました"
	end
end
