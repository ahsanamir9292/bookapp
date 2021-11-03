class SessionsController < ApplicationController
	def new
		
	end

	def create
		@user =	 User.find_by(email: params[:email])&.authenticate(params[:password])
  		if @user.present?
    		session[:user_id] = @user.id
			redirect_to books_path, Success: "Logged in Successfully"
		else
			flash[:danger] = "Invalid Email or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to books_path, danger: "Logged Out"
	end
end
