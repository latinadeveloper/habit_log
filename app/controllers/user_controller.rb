class UserController < ApplicationController
  configure do
    set :views, 'app/views/users'
  end

  get '/signup' do

    if session[:id]
      redirect to '/habits'
    end
    erb :signup
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


end
