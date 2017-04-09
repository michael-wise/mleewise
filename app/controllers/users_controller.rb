class UsersController < ActiveRecord
	#A wonderful get-going-fast guide on bcrypt auth in rails.
	# => https://gist.github.com/thebucknerlife/10090014
	def admin
		#To access this method, check if user is logged in.
		UsersController::before_action :authorize
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