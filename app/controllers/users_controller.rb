class UsersController < ApplicationController
  before_action :require_login, except: [:index, :create]
  #before_action :require_correct_user, only: [:show]
  
  def index
  end
  def create
  	user=User.new(user_params)
  	user.password_digest
  	if user.valid?
  		user.save
  		session[:user_id]= user.id
  		puts "valid user"
  		puts user.first_name
  		flash[:message]= "registered user"
  		redirect_to "/songs"
  	else
  		puts "not valid user"
  		flash[:error]= user.errors.full_messages
      puts flash[:error]
      redirect_to "/main"
  	end		
  end
  def show
    @user_name= User.find(params[:id])
    @user= @user_name.songs
    #@user=@user_name.user_songs
    @songs_liked= UserSong
    @user1= @user.uniq
  end
  def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
