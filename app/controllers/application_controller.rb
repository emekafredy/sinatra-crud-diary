require './config/environment'
require 'sinatra/flash'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "password_security"
		register Sinatra::Flash
	end

  get '/' do
		erb :index
	end

	not_found do
		status 404
		erb :not_found
	end

  helpers do
		def current_user
			User.find(session[:user_id])
		end

		def user_signed_in?
			!!session[:user_id]
		end
	end

end
