class ActivityLogController < ApplicationController

  post '/habits/:id/activity' do
    if logged_in?
      set_habit
      @activity_log = @habit.activity_logs.new(params[:activity_log])
      puts @activity_log.inspect
      if !@activity_log.save
        flash_error(@activity_log)
        erb :'habits/show'
      else
      redirect to "/habits/#{@habit.id}"
      end
    else

      redirect to '/login'
    end
  end

  def set_activity
    @activity = ActivityLog.find(params[:id])
    if @activity.habit.user != current_user
      redirect to '/login'
    end
  end

  get '/activity/:id/edit' do
    if logged_in?
      set_activity
      erb :'activity_logs/edit'
    else
      redirect to '/login'
    end
  end

  patch '/activity/:id' do
    set_activity
    if @activity.update(params[:activity])
      redirect to "/habits/#{@activity.habit.id}"
    else
      redirect to "/activity/#{@activity.id}/edit"
    end
  end

end
