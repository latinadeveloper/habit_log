class ActivityLogController < ApplicationController

  #creates new activity
  post '/habits/:id/activity' do
    if logged_in?
      set_habit
      activity = @habit.activity_logs.new(params[:activity_log])
      if !activity.save
        flash_error(activity)
      end
      redirect to "/habits/#{@habit.id}"
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

  #form to edit activity
  get '/activity/:id/edit' do
    if logged_in?
      set_activity
      erb :'activity_logs/edit'
    else
      redirect to '/login'
    end
  end

  #performs update
  patch '/activity/:id' do
    set_activity
    if @activity.update(params[:activity])
      redirect to "/habits/#{@activity.habit.id}"
    else
      redirect to "/activity/#{@activity.id}/edit"
    end
  end


end
