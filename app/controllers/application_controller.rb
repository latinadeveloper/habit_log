
require 'rack-flash'

class ApplicationController < Sinatra::Base
  def flash_error(model)
    flash[:notice] = model.errors.full_messages.join(", ")
  end
  register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }

  #use Rack::Flash
  enable :sessions
    use Rack::Flash


    def set_habit
      @habit = Habit.find_by_id(params[:id])
      if @habit.user != current_user
        redirect to '/login'
      end
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
