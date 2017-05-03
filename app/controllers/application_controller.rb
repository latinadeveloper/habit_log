require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    use Rack::Flash
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(session[:user_id]) if session[:user_id]
    end

    def set_habit
      @habit = Habit.find_by_id(params[:id])
      if @habit && @habit.user != current_user
        redirect to '/login'
      end
    end

    def flash_error(model)
      flash[:notice] = model.errors.full_messages.join(", ")
    end
  end

  get '/' do
    erb :'/index'
  end
end
