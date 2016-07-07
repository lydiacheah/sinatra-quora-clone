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
	@user = User.new(params[:user])
	if @user.save
		login @user
		redirect '/'
	else
		flash[:error] = @user.errors.values.flatten.first
		redirect '/'
	end
end

post '/login' do
	@user = User.find_by(email: params[:user][:email])
	if @user.nil?
		flash[:error] = "No account found for this email. Retry, or Sign up for Quora."
		redirect '/'
	elsif @user.authenticate(params[:user][:password]) == false
		flash[:error] = "Incorrect password."
		redirect '/'
	else
		login @user
		redirect '/index'
	end
end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/user/:full_name' do
	full_name = params[:full_name].gsub("-", " ")
	@user = User.find_by(full_name: full_name)
	erb :'static/profile'
end

get '/:title' do
	@question = Question.find_by(title: params[:title])
	erb :'static/view_question'
end

