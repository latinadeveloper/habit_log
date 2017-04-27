require 'rack-flash'
class ApplicationController < Sinatra::Base
  def set_habit
    @habit = Habit.find_by_id(params[:id])
  end
use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "habit"

  end

  helpers do
    def logged_in?
      !!session[:id]
    end
    def current_user
      @current_user ||= User.find(session[:id])
    end
  end

  get '/' do
    erb :'/index'
  end


end
