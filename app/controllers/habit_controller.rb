class HabitController < ApplicationController


  get '/habits' do
    if logged_in?
      @habits = current_user.habits
      erb :'habits/index'
    else
      redirect to '/login'
    end
  end

  get '/habits/new' do
    if logged_in?
      erb :'habits/new'
    else
      redirect to '/login'
    end
  end

  post '/habits' do
    ## todo persist data in the form if it fails
    habit = current_user.habits.build(params[:habit])
    if habit.save
      redirect to '/habits'
    else
      flash[:notice] = "must have a title and description"
      redirect to '/habits/new'
    end
  end

  #Show
  get '/habits/:id' do
    redirect to '/login' if !logged_in?
    set_habit
    erb :'habits/show'
  end

  get '/habits/:id/edit' do
    redirect to '/login' if !logged_in?
    set_habit
    erb :'habits/edit'
  end

  patch '/habits/:id' do
    set_habit
    if @habit.update(params[:habit])
      redirect to "/habits/#{@habit.id}"
    else
      redirect to "/habits/#{@habit.id}/edit"
    end
  end

  delete '/habits/:id/delete' do
    set_habit
    if @habit.user == current_user
      @habit.delete
    end
    redirect to '/habits'
  end


end
