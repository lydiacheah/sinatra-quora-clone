enable :sessions

get '/' do
	if logged_in? 
		redirect '/index'
	else 
		erb :"static/login"
	end
end

get '/index' do
	erb :"static/index"
end

post '/signup' do 
	# byebug
	user = User.new(params[:user])
	if user.save
		redirect '/'
	else
		@signup_msg = user.errors.full_messages.first
		redirect '/'
	end
end

post '/login' do
	user = User.find_by(email: params[:user][:email])
	if user.nil?
		@login_msg = "No account found for this email. Retry, or Sign up for Quora."
		redirect '/'
	elsif user.authenticate(params[:user][:password]) == false
		@login_msg = "Incorrect password."
		redirect '/'
	else
		login user
		redirect '/index'
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end