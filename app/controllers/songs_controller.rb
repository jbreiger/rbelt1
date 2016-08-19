class SongsController < ApplicationController
  before_action :require_login
  def index
  	@songs= Song.all
  	@user= User.find(session[:user_id])
  end

  def show
  	@song=Song.find(params[:id])
  	@song= @song
  	@answer= @song.users
    @answer= @answer.uniq
  	#@song_users=UserSong.where(:song_id => @song)
  	#@song_users=UserSong.find(song_id: @song)
  	# @songs_users= Song.find(params[:id])
  end
  def create
  	song= Song.new(song_params)
  	if song.valid?
  		song.save
  		redirect_to "/songs"
  	else 
  		flash[:error]= song.errors.full_messages
  		redirect_to "/songs"
  	end		
  end

  def song_params
  params.require(:song).permit(:artist, :title)
	end
end
