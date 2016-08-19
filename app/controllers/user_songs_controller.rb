class UserSongsController < ApplicationController
	def create
		@song= Song.find(params[:id])
		@user= User.find(session[:user_id])
		UserSong.create(user: @user, song: @song)
		redirect_to "/songs"
	end
end
