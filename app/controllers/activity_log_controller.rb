class ActivityLogController < ApplicationController
  def set_habit
    @habit = Habit.find_by_id(params[:id])
  end

  post '/habits/:id/activity' do
    if logged_in?
      set_habit
      @habit.activity_logs.create(params[:activity_log])
      redirect to "/habits/#{@habit.id}"
    else
      redirect to '/login'
    end
  end

  get '/activity/:id/edit' do

    if logged_in?
      @activity = ActivityLog.find(params[:id])
      erb :'activity_logs/edit'
    else
      redirect to '/login'
    end
  end


end
