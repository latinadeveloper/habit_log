class UserController < ApplicationController

  get '/signup' do

    if session[:id]
      redirect to '/habits'
    end
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(username: params["username"], email: params["email"], password: params["password"])

     if @user.save
       session[:id] = @user.id
       redirect to '/habits'
     else
         redirect to '/signup'
     end

  end

  get '/login' do
    if logged_in?
      redirect to '/habits'
    end
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to '/habits'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/login'
  end



end