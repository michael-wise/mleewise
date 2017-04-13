class UsersController < ActiveRecord
	# BUG! before you can create a new user using /signup, you need you 
	# comment out before_action :authorize, then use /signup to create a 
	# new user, then uncomment before_action :authorize. Remember to 
	# remove all routes for user signup afterwards so people don't get 
	# access to edit things! Later this will be solved with admin flags.
	before_action :authorize
	#A wonderful get-going-fast guide on bcrypt auth in rails.
	# => https://gist.github.com/thebucknerlife/10090014
	def admin
		#To access this method, check if user is logged in.
		index = User.all
	end
	def new

	end
	def create
  		user = User.new(user_params)
	  	if user.save
		    session[:user_id] = user.id
		    redirect_to '/'
	  	else
	    	redirect_to '/signup'
  		end
  	end
  	private

	  	def user_params
	  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end