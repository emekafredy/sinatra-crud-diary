class UserController < ApplicationController

	get '/signup' do
		if user_signed_in?
			flash.next[:greeting] = "Already logged in as #{current_user.username}"
			redirect '/diary-list'
		else
			erb :"users/new"
		end
	end

  post '/signup' do
		user = User.new(params)
		if User.all.any?{|user|user.email.downcase == params["email"].downcase || user.username.downcase == params["username"].downcase}
			flash.next[:error] = "Email or Username is already taken"
			redirect "/signup"
		else
			if user.save
				session[:user_id] = user.id
        puts "NEW SESSION", session[:user_id]
				flash.next[:greeting] = "Welcome, #{user.username}"
				redirect '/diary-list'
			else
				flash.next[:error] = "Username, email, and password are required to create an account."
				redirect '/signup'
			end
		end
	end

  get '/login' do
		if user_signed_in?
			flash.next[:greeting] = "Already logged in as #{current_user.username}"
			redirect '/diary-list'
		else
			erb :"users/login"
		end
	end

  post '/login' do
		user = User.find_by(:username => params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      flash.next[:greeting] = "Welcome back, #{user.username}"
      redirect "/diary-list"
    else
    	flash.next[:error] = "Login Failed. Please Try Again."
      redirect "/login"
	 	end
 	end
end
